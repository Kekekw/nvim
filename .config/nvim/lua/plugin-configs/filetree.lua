vim.cmd([[
        hi link NeoTreeDirectoryName Directory
        hi link NeoTreeDirectoryIcon NeoTreeDirectoryName
      ]])

require("neo-tree").setup {
  filesystem = {
    follow_current_file = true,
    use_libuv_file_watcher = true,
  }
}

local map = vim.api.nvim_set_keymap

map("n", "<C-e>", "<Cmd>NeoTreeRevealToggle<CR>", {noremap = true, silent = true})
