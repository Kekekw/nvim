local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.setup {
    pickers = {
        find_files = {
            hidden = true,
            previewer = false,
        }
    },
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-h>"] = require("telescope").extensions.hop.hop, -- hop.hop_toggle_selection
                ["<C-space>"] = function(prompt_bufnr)
                    local opts = {
                        callback = actions.toggle_selection,
                        loop_callback = actions.send_selected_to_qflist
                    }
                    require("telescope").extensions.hop._hop_loop(prompt_bufnr, opts)
                end
            }
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden"
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        file_sorter = require "telescope.sorters".get_fuzzy_file,
        file_ignore_patterns = { "^./.git/" },
        generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
        color_devicons = true,
        use_less = true,
        set_env = {["COLORTERM"] = "truecolor"},
        file_previewer = require "telescope.previewers".vim_buffer_cat.new,
        grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
        qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
    },
    extensions = {
        hop = {
            -- Highlight groups to link to signs and lines; the below configuration refers to demo
            -- sign_hl typically only defines foreground to possibly be combined with line_hl
            sign_hl = {"WarningMsg", "Title"},
            -- optional, typically a table of two highlight groups that are alternated between
            line_hl = {"CursorLine", "Normal"},
            -- options specific to `hop_loop`
            -- true temporarily disables Telescope selection highlighting
            clear_selection_hl = false,
            -- highlight hopped to entry with telescope selection highlight
            -- note: mutually exclusive with `clear_selection_hl`
            trace_entry = true,
            -- jump to entry where hoop loop was started from
            reset_selection = true
        },
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case"
        }
    }
}

telescope.load_extension("hop")
telescope.load_extension("fzf")

local map = vim.api.nvim_set_keymap

map("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", {noremap = true, silent = true})
map("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>", {noremap = true, silent = true})
map("n", "<Leader>fb", "<Cmd>Telescope resume<CR>", {noremap = true, silent = true})
map("n", "<Leader>fc", "<Cmd>Telescope git_commits<CR>", {noremap = true, silent = true})

map("n", "<Leader>fsd", "<Cmd>Telescope lsp_document_symbols<CR>", {noremap = true, silent = true})
map("n", "<Leader>fsw", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", {noremap = true, silent = true})
map("n", "<Leader>fr", "<Cmd>Telescope lsp_references<CR>", {noremap = true, silent = true})
map("n", "<Leader>ca", "<Cmd>Telescope lsp_code_actions<CR>", {noremap = true, silent = true})
