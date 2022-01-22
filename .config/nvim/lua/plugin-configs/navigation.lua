require("hop").setup({keys = "asdfghjkl;"})

local map = vim.api.nvim_set_keymap

map("n", "<Leader>hl", ":HopLine<CR>", {noremap = true, silent = true})
map("n", "<Leader>hw", ":HopWord<CR>", {noremap = true, silent = true})

require("harpoon").setup(
    {
        global_settings = {
            save_on_toggle = true
        }
    }
)

map(
    "n",
    "<leader><Backspace>",
    '<CMD>lua require("harpoon.ui").toggle_quick_menu()<CR>',
    {noremap = true, silent = true}
)
map("n", "<Leader>m", '<CMD>lua require("harpoon.mark").add_file()<CR>', {noremap = true, silent = true})
map("n", "<Leader>0", '<CMD>lua require("harpoon.ui").nav_file(0)<CR>', {noremap = true, silent = true})
map("n", "<Leader>1", '<CMD>lua require("harpoon.ui").nav_file(1)<CR>', {noremap = true, silent = true})
map("n", "<Leader>2", '<CMD>lua require("harpoon.ui").nav_file(2)<CR>', {noremap = true, silent = true})
map("n", "<Leader>3", '<CMD>lua require("harpoon.ui").nav_file(3)<CR>', {noremap = true, silent = true})
map("n", "<Leader>4", '<CMD>lua require("harpoon.ui").nav_file(4)<CR>', {noremap = true, silent = true})
map("n", "<Leader>5", '<CMD>lua require("harpoon.ui").nav_file(5)<CR>', {noremap = true, silent = true})
map("n", "<Leader>6", '<CMD>lua require("harpoon.ui").nav_file(6)<CR>', {noremap = true, silent = true})
map("n", "<Leader>7", '<CMD>lua require("harpoon.ui").nav_file(7)<CR>', {noremap = true, silent = true})
map("n", "<Leader>8", '<CMD>lua require("harpoon.ui").nav_file(8)<CR>', {noremap = true, silent = true})
map("n", "<Leader>9", '<CMD>lua require("harpoon.ui").nav_file(9)<CR>', {noremap = true, silent = true})
map("n", "<Leader><Home>", '<CMD>lua require("harpoon.ui").nav_prev()<CR>', {noremap = true, silent = true})
map("n", "<Leader><End>", '<CMD>lua require("harpoon.ui").nav_next()<CR>', {noremap = true, silent = true})
