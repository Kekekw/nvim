require("litee.lib").setup({})
require("litee.gh").setup({})

local map = vim.api.nvim_set_keymap

map("n", "<Leader>g", ":Git<CR>", {noremap = true, silent = true})
