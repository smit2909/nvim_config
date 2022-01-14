lua <<EOF
 local types = require('cmp.types')
 local cmp = require'cmp'

 require'cmp'.setup {
     snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
     },
     sources = {
         { name = 'nvim_lsp', max_item_count = 10 },
         { name = 'vsnip' },
         { name = 'nvim_lua', max_item_count = 10  },
         { name = 'buffer', max_item_count = 10  },
         { name = 'path', max_item_count = 10  },
         { name = 'emoji' },
         { name = 'calc' }
     },

    mapping = {
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
      ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), {'i', 's'})
    },

    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },

    formatting = {
       format = function(entry, vim_item)
         -- fancy icons and a name of kind
         vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

         -- set a name for each source
         vim_item.menu = ({
           buffer = "[Buffer]",
           nvim_lsp = "[LSP]",
           luasnip = "[LuaSnip]",
           nvim_lua = "[Lua]",
           latex_symbols = "[Latex]",
         })[entry.source.name]
         return vim_item
       end,
     },
     preselect = types.cmp.PreselectMode.None,
     experimental = {
         native_menu = false,
         ghost_text = false
         }

 }

local util = require('lspconfig/util')

local path = util.path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv from pipenv in workspace directory.
  local match = vim.fn.glob(path.join(workspace, 'Pipfile'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('PIPENV_PIPFILE=' .. match .. ' pipenv --venv'))
    return path.join(venv, 'bin', 'python')
  end

  -- Fallback to system Python.
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

 require('lspconfig')['pyright'].setup {
     capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
     on_init = function(client)
        client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
     end
 }

 require('lspconfig')['gopls'].setup {
     capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
 }

 require('lspconfig')['vimls'].setup {
     capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
 }

 require('lspconfig')['bashls'].setup {
     capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
 }

 require('lspconfig')['yamlls'].setup {
     capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
 }

 require('lspconfig')['html'].setup {
     capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
 }

 require('lspconfig')['cssls'].setup {
     capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
 }

-- nvim-cmp highlight groups.
--local Group = require("colorbuddy.group").Group
--local g = require("colorbuddy.group").groups
--local s = require("colorbuddy.style").styles
--
--Group.new("CmpItemAbbr", g.Comment)
--Group.new("CmpItemAbbrDeprecated", g.Error)
--Group.new("CmpItemAbbrMatchFuzzy", g.CmpItemAbbr.fg:dark(), nil, s.italic)
--Group.new("CmpItemKind", g.Special)
--Group.new("CmpItemMenu", g.NonText)

local function PreviewWindowKeymap(curr_buff, curr_win)
    -- set esc to close the preview window
    vim.api.nvim_buf_set_keymap(curr_buff, 'n', '<Esc>', ':q<CR>', {noremap = true})
end

require('goto-preview').setup{
    post_open_hook = PreviewWindowKeymap
}

require('smit.lspkind').init({
 with_text = true,
 symbol_map = {
   Text = '',
   Method = 'ƒ',
   Function = '',
   Constructor = '',
   Variable = '',
   Class = '',
   Interface = 'ﰮ',
   Module = '',
   Property = '',
   Unit = '',
   Value = '',
   Enum = '了',
   Keyword = '',
   Snippet = '﬌',
   Color = '',
   File = '',
   Folder = '',
   EnumMember = '',
   Constant = '',
   Struct = ''
 },
})

local pop_opts = { border = "rounded", max_width = 80 }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)

vim.diagnostic.config({
  float = {
    source = 'always',
  },
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
EOF

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

"" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap vsh <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gr    <cmd>lua require'telescope.builtin'.lsp_references()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>vrn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>cd   <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
"nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
"nnoremap <leader>f      <cmd>lua vim.lsp.buf.formatting()<CR>

nmap <leader>tt  <Plug>(toggle-lsp-diag)
nnoremap gp <cmd>lua require('goto-preview').goto_preview_definition()<CR>

" OLD NVIM COMPE CONFIG
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'disable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
