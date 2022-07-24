vim.g.neoformat_enabled_typescript = {"prettier"}
vim.g.neoformat_enabled_javascript = {"prettier"}
vim.g.neoformat_enabled_python = {"autopep8"}
vim.g.neoformat_enabled_lua = {"luafmt"}

vim.g.neoformat_basic_format_align = 1
vim.g.neoformat_basic_format_retab = 1
vim.g.neoformat_basic_format_trim = 1
vim.g.neoformat_try_formatprg = 1

local map = vim.api.nvim_set_keymap

map("n", "<leader>if", ":Neoformat<CR>", {noremap = true, silent = true})
