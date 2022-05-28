vim.opt.scrolloff = 8
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wrap = false
vim.opt.incsearch = true

-- clipboard
vim.opt.clipboard:append({"unnamedplus"})

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- mouse
vim.opt.mouse = "a"

-- visual cues
vim.opt.colorcolumn = "120"

-- indicator column
vim.opt.signcolumn = "yes"

-- navigate away from a modified file without first
-- saving it.
vim.opt.hidden = true

-- enable folding and prevent folding when opening a file
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 20
vim.opt.foldlevelstart = 20

-- python provider configuration
-- makes startup faster
vim.g.python3_host_prog = "/usr/bin/python3"

vim.opt.laststatus = 3
