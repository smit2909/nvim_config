" =====================================================================================================================
" Color schemes
" =====================================================================================================================

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

" colorscheme: need to set here to enable lsp coloring
fun! ColorMyPencils()

    set background=dark
    " color scheme settings
    let g:gruvbox_italics = 0
    let g:gruvbox_bold = 0
    let g:gruvbox_contrast_dark='hard'
    let g:gruvbox_invert_selection=0


    "lua require('colorbuddy').colorscheme('gruvbuddy')
    "colorscheme gruvbox
    lua require("leaf").setup({ theme = "darker", })
    let g:nvcode_termcolors=256
    "colorscheme base16-gruvbox-dark-hard

    "gruvbox baby config
    let g:gruvbox_baby_function_style = "NONE"
    let g:gruvbox_baby_keyword_style = "italic"

    "" Enable telescope theme
    let g:gruvbox_baby_telescope_theme = 1

    "" Enable transparent mode
    "let g:gruvbox_baby_transparent_mode = 1

    "" Load the colorscheme
    colorscheme base16-gruvbox-dark-hard

    set termguicolors
    let g:doom_one_cursor_coloring=v:false

    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif

    " color of the ruler
    "highlight ColorColumn ctermbg=0 guibg=#313335
    "highlight ColorColumn ctermbg=0 guibg=#23272e

    "transparent background
    "highlight Normal guibg=none

    " transparent line number column and git column
    highlight clear LineNr
    highlight clear SignColumn

    "line number colors
    "orange
    "highlight LineNr guifg=#ff8659

    "green
    "highlight LineNr guifg=#aed75f

    "blue
    highlight LineNr guifg=#5eacd3

    "make the signcolumn bg color same as the number column color
    highlight clear SignColumn

    "highlight netrwDir guifg=#5eacd3

    " configure lightline
    "call ConfigureLightline()

    " for default colorscheme
    "if g:colors_name == 'default'
        "set t_Co=8
        "set t_md=
        "highlight Pmenu ctermbg=gray guibg=gray
        ""let g:lightline.colorscheme = '16color'
    "endif

endfun

call ColorMyPencils()
nnoremap <C-b> :call BGToggleTransparency()<CR>

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

hi DiagnosticUnderlineError guisp=#fb4934 gui=undercurl "red
hi DiagnosticUnderlineWarn guisp=#fe8019 gui=undercurl "orange
hi DiagnosticUnderlineInfo guisp=#fabd2f gui=undercurl "yellow
hi DiagnosticUnderlineHint guisp=#ffffff gui=undercurl "green
