local opt = vim.opt

vim.opt.clipboard = "unnamedplus"

opt.number = true
vim.opt.numberwidth = 5 -- Sets the minimal width for the number column
opt.relativenumber = true
vim.opt.statuscolumn = "%s %l %r  " -- Show absolute line numbers (for all lines) in addition to relative line number

opt.termguicolors = true

vim.o.smartindent = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable 24-bit colour
vim.opt.termguicolors = true

-- Does not handle special buffers. Add warning in this case?
--vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
--  pattern = "*",
--  callback = function()
--    if vim.bo.modified then
--      vim.cmd("silent write")
--    end
--  end,
--})
