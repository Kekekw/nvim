local map = vim.api.nvim_set_keymap

map("n", "<Leader>re", "<Plug>RestNvim", { noremap = true, silent = true })
map("n", "<Leader>rp", "<Plug>RestNvimPreview", { noremap = true, silent = true })
map("n", "<Leader>rl", "<Plug>RestNvimLast", { noremap = true, silent = true })
