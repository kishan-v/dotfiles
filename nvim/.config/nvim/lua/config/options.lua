local opt = vim.opt

vim.opt.clipboard = "unnamedplus"

opt.number = true
-- vim.opt.numberwidth = 5 -- Sets the minimal width for the number column
opt.relativenumber = true
-- vim.opt.statuscolumn = "%s %l %r  " -- Show absolute line numbers (for all lines) in addition to relative line number. NOTE: THIS WAS BROKEN IN NeoVim v0.11.0
-- ATTEMPTED FIXES:
vim.o.statuscolumn = [[%! (v:virtnum == 0 ? printf('%3d%3d   ', v:lnum, abs(v:lnum - line('.'))) : '         ') ]] -- Show absolute line numbers (for all lines) in addition to relative line number. Note: may not handle signs correctly. Note: the padding between absolute and relative line numbers may disappear when relative line numbers show 3 digits or more.
-- vim.opt.statuscolumn = "%s %{v:virtnum==0?v:lnum:''} %{v:virtnum==0?v:relnum:''} "  -- Shows signs correctly but padding is weird

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
