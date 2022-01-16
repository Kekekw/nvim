-- colorscheme
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_palette = 'original'

vim.cmd('colorscheme gruvbox-material')

-- whitespaces
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
  show_end_of_line = true,
  space_char_blankline = " ",
}
