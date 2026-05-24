-- require "nvchad.mappings"
local ts_builtin = require('telescope.builtin')
local map = vim.keymap.set

vim.g.mapleader = ' '

map('n', '<leader>pf', function()
  ts_builtin.find_files({ hidden = true })
end, { desc = "Telescope find files" })

map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })

map('n', '<leader>pg', ts_builtin.live_grep, { desc = 'Telescope live grep' })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

map("v", "<", "<gv", { desc = "Unindent" })
map("v", ">", ">gv", { desc = "Indent" })
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Split windows
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Horizontal split" })

-- Move cursor up 5 lines and center screen
map("n", "<S-Up>", function()
  vim.cmd("normal! 5kzz")
end, { desc = "Move cursor up 5 lines and center" })

-- Move cursor down 5 lines and center screen
map("n", "<S-Down>", function()
  vim.cmd("normal! 5jzz")
end, { desc = "Move cursor down 5 lines and center" })
-- Move cursor up 5 lines in visual mode and center screen
map("v", "<S-Up>", function()
  vim.cmd("normal! 5k")
  vim.cmd("normal! gvzz")  -- reselect visual area and center
end, { desc = "Move selection up 5 lines and center" })

-- Move cursor down 5 lines in visual mode and center screen
map("v", "<S-Down>", function()
  vim.cmd("normal! 5j")
  vim.cmd("normal! gvzz")  -- reselect visual area and center
end, { desc = "Move selection down 5 lines and center" })

-- Navigate splits
map("n", "<C-h>", "<C-w>h", { desc = "Go left split" })
map("n", "<C-l>", "<C-w>l", { desc = "Go right split" })
map("n", "<C-j>", "<C-w>j", { desc = "Go down split" })
map("n", "<C-k>", "<C-w>k", { desc = "Go up split" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- FSTree
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })

map("n", "<leader>r", function()
  require("nvim-tree.api").tree.reload()
end)
