vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")
vim.keymap.set("n", "<C-g>", "3<C-w>_") -- minimize terminal split

vim.api.nvim_set_keymap("n", "<leader>c", ":nohlsearch<CR>", { noremap = true, silent = true }) -- Clear 'forward search' buffer
