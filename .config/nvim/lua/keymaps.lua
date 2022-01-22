vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap

map("n", "<Leader><CR>", ":so ~/.config/nvim/init.lua<CR>", {noremap = true})
map("v", "<Leader>p", '"_dP', {noremap = true})

-- Use ctrl-[hjkl] to select the active split
map("n", "<C-k>", ":wincmd k<CR>", {noremap = true, silent = true})
map("n", "<C-j>", ":wincmd j<CR>", {noremap = true, silent = true})
map("n", "<C-h>", ":wincmd h<CR>", {noremap = true, silent = true})
map("n", "<C-l>", ":wincmd l<CR>", {noremap = true, silent = true})

-- remap increment, clashes with tmux <C-a>
map("n", "<C-q>", "<C-a>", {noremap = true})

-- clear search results highlights
map("n", "<Leader>nh", ":nohls<CR>", {noremap = true, silent = true})

-- quickfix list
map("n", "<Up>", ":cnext<CR>", {noremap = true, silent = true})
map("n", "<Down>", ":cprev<CR>", {noremap = true, silent = true})
map("n", "<C-Up>", ":cfirst<CR>", {noremap = true, silent = true})
map("n", "<C-Down>", ":clast<CR>", {noremap = true, silent = true})

map("n", "<Leader>cfs", ":lua require('./utils').toggle_quickfix()<CR>", {noremap = true, silent = true})
map("n", "<Leader>cfc", ":cexpr []<CR>", {noremap = true, silent = true})

-- Stamping
map("n", "S", 'diw"0P', {noremap = true, silent = true})

-- make term mode more usable
map("t", "<Esc>", "<C-\\><C-n>", {noremap = true})
