vim.g.chadtree_settings = {
    ["options.show_hidden"] = false,
    ["options.session"] = false,
    ["view.sort_by"] = {"is_folder", "file_name", "ext"},
    ["keymap.tertiary"] = {"<C-t>"},
    ["keymap.v_split"] = {"<C-v>"},
    ["keymap.h_split"] = {"<C-x>"},
    ["keymap.collapse"] = {"za"},
    ["theme.icon_glyph_set"] = "ascii"
}

local map = vim.api.nvim_set_keymap

map("n", "<C-e>", "<Cmd>CHADopen<CR>", {noremap = true, silent = true})
