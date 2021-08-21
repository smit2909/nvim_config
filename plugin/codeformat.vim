let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_html = ['prettier']

" for formatter.nvim
lua << EOF
require('formatter').setup({
  logging = false,
  filetype = {
    python = {
        -- black
       function()
          return {
            exe = "black",
            args = {'-'},
            stdin = true
          }
        end
    },
    javascript = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    },
    html = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    },
    htmldjango = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
    },
}
})
EOF
nnoremap <silent> <leader>f :Format<CR>
