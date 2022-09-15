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
highlight clear SignColumn

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
]]

-- set colorscheme
--require('colorbuddy').colorscheme('gruvbuddy')

require("tokyonight").setup({
  style = "night",
  transparent = true,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "transparent", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
})

-- Lua
require('onedark').setup  {
    -- Main options --
    style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'italic',
        functions = 'italic',
        strings = 'none',
        variables = 'none'
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = false, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}
-- Lua
vim.cmd [[colorscheme onedark]]
