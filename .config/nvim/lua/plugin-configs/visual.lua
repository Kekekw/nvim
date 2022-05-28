-- colorscheme
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.cmd("colorscheme gruvbox")

-- whitespaces
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " "
}
