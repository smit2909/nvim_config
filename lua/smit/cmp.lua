local cmp = require 'cmp'
local types = require('cmp.types')

require 'cmp'.setup {
     snippet = {
      expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
     },
     sources = {
         { name = 'nvim_lsp', max_item_count = 10 },
         { name = 'vsnip' },
         { name = 'nvim_lua', max_item_count = 10 },
         { name = 'buffer', max_item_count = 10 },
         { name = 'path', max_item_count = 10 },
         { name = 'emoji' },
         { name = 'calc' }
     },

     mapping = {
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
      ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { 'i', 's' })
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
