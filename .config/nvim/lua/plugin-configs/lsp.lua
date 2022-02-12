local util = require "lspconfig/util"

require "lspconfig".tsserver.setup {
    cmd = {"typescript-language-server", "--stdio"},
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
    init_options = {
        hostInfo = "neovim"
    },
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    on_attach = function(client, bufnr)
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup {
            debuger = true
        }
        ts_utils.setup_client(client)
    end
}

require "lspconfig".diagnosticls.setup {
    filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "css"},
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    init_options = {
        filetypes = {
            javascript = "eslint",
            typescript = "eslint",
            javascriptreact = "eslint",
            typescriptreact = "eslint"
        },
        linters = {
            eslint = {
                sourceName = "eslint",
                command = "./node_modules/.bin/eslint",
                rootPatterns = {
                    ".eslitrc.js",
                    "package.json"
                },
                debounce = 100,
                args = {
                    "--cache",
                    "--stdin",
                    "--stdin-filename",
                    "%filepath",
                    "--format",
                    "json"
                },
                parseJson = {
                    errorsRoot = "[0].messages",
                    line = "line",
                    column = "column",
                    endLine = "endLine",
                    endColumn = "endColumn",
                    message = "${message} [${ruleId}]",
                    security = "severity"
                },
                securities = {
                    [2] = "error",
                    [1] = "warning"
                }
            }
        }
    }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require "lspconfig".jsonls.setup {
    capabilities = capabilities,
    settings = {
        json = {
            schemas = require("schemastore").json.schemas()
        }
    }
}

require "lspconfig".vuels.setup {}
require "lspconfig".pyright.setup {}

local map = vim.api.nvim_set_keymap

map("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
map("n", "<F12>", ":lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
map("n", "<Leader>e", ":lua vim.diagnostic.open_float()<CR>", {noremap = true, silent = true})
map("n", "<Leader>n", ":lua vim.diagnostic.goto_next()<CR>", {noremap = true, silent = true})
map("n", "<Leader>p", ":lua vim.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
map("n", "<leader>d", ":lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
