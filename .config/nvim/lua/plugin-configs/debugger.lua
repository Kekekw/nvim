local map = vim.api.nvim_set_keymap

map("n", "<Leader>dd", ":call vimspector#Launch()<CR>", {noremap = true, silent = true})
map("n", "<Leader>dr", ":call vimspector#Reset()<CR>", {noremap = true, silent = true})
map("n", "<Leader>dc", ":call vimspector#Continue()<CR>", {noremap = true, silent = true})

map("n", "<Leader>db", ":call vimspector#ToggleBreakpoint()<CR>", {noremap = true, silent = true})
map("n", "<leader>dB", ":call vimspector#ClearBreakpoints()<CR>", {noremap = true, silent = true})

map("n", "<Leader>dk", ":call vimspector#Restart()<CR>", {noremap = true, silent = true})
map("n", "<Leader>dh", ":call vimspector#StepOut()<CR>", {noremap = true, silent = true})
map("n", "<Leader>dl", ":call vimspector#StepInto()<CR>", {noremap = true, silent = true})
map("n", "<Leader>dj", ":call vimspector#StepOver()<CR>", {noremap = true, silent = true})
