local util = require "lspconfig/util"

require("mason-lspconfig").setup {}
local lspconfig = require("lspconfig")

-- requires $ npm install -g typescript typescript-language-server
lspconfig.tsserver.setup {
    cmd = {"typescript-language-server", "--stdio"},
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
    init_options = {
        hostInfo = "neovim"
    },
    flags = {
        debounce_text_changes = 30
    },
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    on_attach = function(client, bufnr)
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup {}
        ts_utils.setup_client(client)
    end,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.jsonls.setup {
    capabilities = capabilities,
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        }
    }
}

lspconfig.vuels.setup {}
lspconfig.pyright.setup {}
lspconfig.terraformls.setup {}
lspconfig.yamlls.setup {}
lspconfig.rust_analyzer.setup {}

-- Function signature tooltip
require "lsp_signature".setup(
    {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
            border = "rounded"
        },
        select_signature_key = "<C-n>"
    }
)

-- Trouble
require "trouble".setup {}


-- null-ls
local null_ls = require("null-ls")

local sources = {
    -- requires $ npm install -g eslint_d
  null_ls.builtins.code_actions.eslint_d,
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.tsc,
  null_ls.builtins.formatting.eslint_d,
}

require("null-ls").setup({ sources = sources })

local map = vim.api.nvim_set_keymap

map("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
map("n", "<F12>", ":lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
map("n", "<Leader>e", ":lua vim.diagnostic.open_float()<CR>", {noremap = true, silent = true})
map("n", "<Leader>n", ":lua vim.diagnostic.goto_next()<CR>", {noremap = true, silent = true})
map("n", "<Leader>p", ":lua vim.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
map("n", "<Leader>d", ":lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
map("n", "<Leader>t", "<CMD>TroubleToggle<CR>", {noremap = true, silent = true})
