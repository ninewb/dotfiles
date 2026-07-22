-- ============================================================================
-- 1. Native Neovim Options
-- ============================================================================
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Quality of Life Options
vim.opt.number = true                  -- Show line numbers
vim.opt.relativenumber = true          -- Relative line numbers
vim.opt.clipboard = "unnamedplus"      -- Sync Neovim with OS clipboard
vim.opt.ignorecase = true              -- Case-insensitive search...
vim.opt.smartcase = true               -- ...unless capital letters are used
vim.opt.scrolloff = 8                  -- Keep 8 lines visible around cursor
vim.opt.wrap = false                   -- Prevent long log lines from wrapping
vim.opt.signcolumn = "yes"             -- Always show sign column (prevents UI jump)

-- ============================================================================
-- 2. Plugin Manager (lazy.nvim) & Plugin Specifications
-- ============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Keymap Hint Popup
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Status Line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { options = { theme = "catppuccin" } },
  },

  -- Git Status Signs
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },

  -- Fuzzy Search (Telescope)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Neo-tree Explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },

  -- Log Highlighting
  {
    "fei6409/log-highlight.nvim",
    config = function()
      require("log-highlight").setup({})
    end,
  },

  -- Large File Protection (Logs/JSON)
  { "LunarVim/bigfile.nvim" },

  -- Lightweight JSON Browser
  {
    "gennaro-tedesco/nvim-jqx",
    ft = { "json", "yaml" },
  },

  -- Formatter (JSON / Code)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        json = { "jq" },
      },
    },
  },
}

require("lazy").setup(plugins, {})

-- ============================================================================
-- 3. Plugin Configurations & Keymaps
-- ============================================================================
-- Treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "awk", "bash", "jq", "lua", "markdown_inline", "python", "terraform", "yaml" },
  highlight = { enable = true },
  indent = { enable = true },
})

-- Keymaps
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep text" })
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', { desc = "Toggle Neo-tree" })

-- Format buffer (Space + f)
vim.keymap.set({ "n", "v" }, "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer (jq)" })

-- Toggle Line Wrap (Space + w) — Great for toggling long log lines
vim.keymap.set("n", "<leader>w", ":set wrap!<CR>", { desc = "Toggle line wrap" })

-- Colorscheme
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
