require "nvchad.mappings"
local ts_builtin = require('telescope.builtin')
local map = vim.keymap.set

vim.g.mapleader = ' '

map('n', '<leader>pf', function()
  ts_builtin.find_files({ hidden = true })
end, { desc = "Telescope find files" })

map('n', '<leader>pg', ts_builtin.live_grep, { desc = 'Telescope live grep' })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

map("v", "<", "<gv", { desc = "Unindent" })
map("v", ">", ">gv", { desc = "Indent" })
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Split windows
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Horizontal split" })

-- rename vars
-- map('n', "<leader>rn", vim.lsp.buf.rename)

-- vim.keymap.del("n", "<leader>ra")
-- vim.keymap.set("n", "<leader>rv", require("nvchad.lsp.renamer"), { desc = "NvRenamer" })

-- Navigate splits
map("n", "<C-h>", "<C-w>h", { desc = "Go left split" })
map("n", "<C-l>", "<C-w>l", { desc = "Go right split" })
map("n", "<C-j>", "<C-w>j", { desc = "Go down split" })
map("n", "<C-k>", "<C-w>k", { desc = "Go up split" })
