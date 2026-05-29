for config (~/.config/zsh/*.zsh) source $config

# Load 1Password secrets last so they are available everywhere
if [ -f "$HOME/.config/zsh/.openv" ]; then
    set -a
    source "$HOME/.config/zsh/.openv"
    set +a
fi

setenv() {
    # 1. Safeguard check
    if [ -z "$VAULT_ID" ]; then
        echo "Error: VAULT_ID is not set!"
        return 1
    fi

    # 2. Define the target directory and file
    local TARGET_DIR="$HOME/.config/zsh"
    local TARGET_FILE="$TARGET_DIR/.openv"

    # 3. Ensure the target directory exists
    mkdir -p "$TARGET_DIR"

    # 4. Read 1Password environments vault, capture the environment, and write it to the file
    # We use 'env' instead of 'printenv' to easily filter out default system variables
    echo "Fetching vault secrets and writing to $TARGET_FILE..."
    op environment read "$VAULT_ID" > "$TARGET_FILE"    

    if [ $? -eq 0 ]; then
        echo "Successfully updated $TARGET_FILE"
        echo "Sourcing secrets into active shell..."
        set -a
        source "$TARGET_FILE"
        set +a
        echo "Ready! Your tokens are live."
    else
        echo "ERROR: Failed to write secrets."
        return 1
    fi
}
