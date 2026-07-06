require("custom.lazy")

local set = vim.opt
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.expandtab = true
set.smartindent = true
set.shiftround = true
set.number = true
set.relativenumber = true
set.clipboard = "unnamedplus"

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Highlight when yanking text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight_on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
	vim.highlight.on_yank()
    end,
})

vim.diagnostic.config({
    virtual_text = {
	spacing = 2,
	source = "if_many",
    },
    signs = true,
    underline = true,
    severity_sort = true,
})

