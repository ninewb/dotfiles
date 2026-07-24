for config (~/.config/zsh/*.zsh) source $config

# Load 1Password secrets last so they are available everywhere
if [ -f "$HOME/.config/zsh/.openv" ]; then
    set -a
    source "$HOME/.config/zsh/.openv"
    set +a
fi

setenv() {
    if ! command -v op &> /dev/null; then
        echo "Error: 1Password CLI ('op') is not installed or not in PATH."
        return 1
    fi

    if [ -z "$VAULT_ID" ]; then
        echo "Error: VAULT_ID is not set!"
        return 1
    fi

    local TARGET_DIR="$HOME/.config/zsh"
    local TARGET_FILE="$TARGET_DIR/.openv"
    local CACHE_TTL_SECONDS=3600  # Re-sync automatically every 1 hour (3600s)

    mkdir -p "$TARGET_DIR"

    local need_sync=0
    if [ ! -f "$TARGET_FILE" ]; then
        need_sync=1
    else
        # Compare file modification time to current time
        local file_mod_time
        if [[ "$OSTYPE" == "darwin"* ]]; then
            file_mod_time=$(stat -f %m "$TARGET_FILE" 2>/dev/null || echo 0)
        else
            file_mod_time=$(stat -c %Y "$TARGET_FILE" 2>/dev/null || echo 0)
        fi
        
        local now=$(date +%s)
        if (( now - file_mod_time > CACHE_TTL_SECONDS )); then
            echo "Secrets cache is stale (>1 hour old). Syncing with 1Password..."
            need_sync=1
        fi
    fi

    if [ "$need_sync" -eq 1 ]; then
        # Create/touch file and enforce strict read/write permissions (Owner only: rw-------)
        touch "$TARGET_FILE"
        chmod 600 "$TARGET_FILE"

        echo "Fetching vault secrets from 1Password..."
        if op environment read "$VAULT_ID" > "$TARGET_FILE"; then
            echo "Successfully updated $TARGET_FILE"
        else
            echo "ERROR: Failed to fetch secrets from 1Password."
            return 1
        fi
    fi

    set -a
    source "$TARGET_FILE"
    set +a
    echo "Ready! Your tokens are live."
}
