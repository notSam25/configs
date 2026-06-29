vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "md" },
    config = function()
      require("render-markdown").setup({})
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

-- session stuff
-- init.lua (near the end)

vim.api.nvim_create_user_command("SaveState", function()
  local session_path = vim.fn.getcwd() .. "/.nvim-session.vim"
  vim.cmd("mksession! " .. session_path)
end, { desc = "Save Neovim session into ./.nvim-session.vim" })

vim.api.nvim_create_user_command("LoadState", function()
  local session_path = vim.fn.getcwd() .. "/.nvim-session.vim"
  if vim.fn.filereadable(session_path) == 1 then
    vim.cmd("source " .. session_path)
  end
end, { desc = "Load ./.nvim-session.vim session if it exists" })

vim.cmd([[cabbrev qs SaveState]])
vim.cmd([[cabbrev ql LoadState]])

-- Auto-load on startup (after config/plugin setup)
-- local session_path = vim.fn.getcwd() .. "/.nvim-session.vim"
-- if vim.fn.filereadable(session_path) == 1 then
--   vim.cmd("source " .. session_path)
-- end
