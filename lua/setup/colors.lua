-- barbar config
vim.g.bufferline = { icons = 'both' }

-- specs config
require('specs').setup {
  show_jumps = true,
  min_jump = 20,
  popup = {
    delay_ms = 0, -- delay before popup displays
    inc_ms = 10, -- time increments used for fade/resize effects
    blend = 40, -- starting blend, between (fully opaque) 0-100, see :h winblend
    width = 20,
    winhl = "PMenu",
    fader = require('specs').linear_fader,
    resizer = require('specs').shrink_resizer
  },
  ignore_filetypes = {},
  ignore_buftypes = { nofile = true }
}

-- indent guide config
-- vim.cmd [[highlight IndentBlanklineContextChar guifg=#C678DD gui=nocombine]]

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  -- show_current_context_start = true,
  filetype_exclude = { "dashboard", "nerdtree", "alpha", "packer" }
}


vim.cmd [[
let t:isTransparent = 0
function! BGToggleTransparency()
  if t:isTransparent == 0
    hi Normal guibg=#111111 ctermbg=black
    set background=dark
    let t:isTransparent = 1
  else
    hi Normal guibg=NONE ctermbg=NONE
    let t:isTransparent = 0
  endif
endfunction

nnoremap <C-b> :call BGToggleTransparency()<CR>

" transparent line number column and git column
highlight clear LineNr
highlight clear SignColumn

"blue
highlight LineNr guifg=#5eacd3

"make the signcolumn bg color same as the number column color
"highlight clear SignColumn

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
]]

-- set colorscheme
require('colorbuddy').colorscheme('gruvbuddy')
--require("setup.onedark")

-- Lua
vim.cmd [[
  "hi Normal guibg=NONE ctermbg=NONE
  set termguicolors
  "colorscheme tokyonight
]]
