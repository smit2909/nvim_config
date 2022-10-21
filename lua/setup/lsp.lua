local util = require('lspconfig/util')
local path = util.path
-- ============================================================================================================
-- handler setups
local pop_opts = { border = "rounded", max_width = 80 }

-- virtual text is disabled
vim.diagnostic.config({ virtual_text = true, severity_sort = true })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
    { undercurl = true, virtual_text = true, signs = { severity_limit = "Hint" } })

-- ============================================================================================================
-- python env sourcing
local function get_python_path(workspace)
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python') end

    -- Find and use virtualenv from pipenv in workspace directory.
    local match = vim.fn.glob(path.join(workspace, 'Pipfile'))
    if match ~= '' then
        local venv = vim.fn.trim(vim.fn.system('PIPENV_PIPFILE=' .. match .. ' pipenv --venv'))
        return path.join(venv, 'bin', 'python')
    end

    -- Fallback to system Python.
    return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

-- ============================================================================================================
-- language server setups
require('lspconfig')['pyright'].setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_init = function(client)
        client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
    end
}

require('lspconfig')['gopls'].setup { capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    root_dir = util.root_pattern("go.mod") }
require('lspconfig')['vimls'].setup { capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) }

require('lspconfig')['bashls'].setup { capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) }

require('lspconfig')['yamlls'].setup { capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) }

require('lspconfig')['html'].setup { capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) }

require('lspconfig')['cssls'].setup { capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) }

require('lspconfig')['gopls'].setup {
    settings = { gopls = { analyses = { unusedparams = true }, staticcheck = true } }
    -- root_dir = nvim_lsp.util.root_pattern("go.mod", ".git", ".gitignore", "README.md"),
}
require('lspconfig')['rust_analyzer'].setup {
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            assist = {
                importEnforceGranularity = true,
                importPrefix = "crate"
            },
            cargo = {
                allFeatures = true,
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
}

function goimports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for cid, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if r.edit then
                local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
        end
    end
end

-- lazy loading the lua-dev
--local status_ok, _ = pcall(require, "lua-dev")
--if status_ok then
--local luadev = require("lua-dev").setup({
--lspconfig = {
--cmd = { "/home/smit/lua_lsp_source/lua-language-server/bin/lua-language-server" },
--on_attach = function(client)
--client.resolved_capabilities.document_formatting = false
--client.resolved_capabilities.document_range_formatting = false
--end
--}
--})
--require('lspconfig')['sumneko_lua'].setup(luadev)
--end

-- ============================================================================================================
-- diagnostic settings
vim.diagnostic.config({ float = { source = 'always', border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } } })

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Toogle diagnostics
local M = {}
local diagnostics_active = true
local toggle_diagnostics = function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.api.nvim_echo({ { "Show diagnostics" } }, false, {})
        vim.diagnostic.enable()
    else
        vim.api.nvim_echo({ { "Disable diagnostics" } }, false, {})
        vim.diagnostic.disable()
    end
end
M.toggle_diagnostics = toggle_diagnostics
return M
