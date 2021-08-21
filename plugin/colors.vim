" =====================================================================================================================
" Color schemes
" =====================================================================================================================

lua <<EOF
require('smit.evilline')
require('specs').setup{
    show_jumps  = true,
    min_jump = 20,
    popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 10, -- time increments used for fade/resize effects
        blend = 40, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 20,
        winhl = "PMenu",
        fader = require('specs').linear_fader,
        resizer = require('specs').shrink_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
}
-- require('smit.neoline')
EOF

" colorscheme: need to set here to enable lsp coloring
fun! ColorMyPencils()

    "let g:indentLine_char_list = ['|', '¦', '┆', '┊']
    let g:indentLine_char_list = ['|']

    set background=dark

    " color scheme settings
    let g:gruvbox_italics = 0
    let g:gruvbox_bold = 0
    let g:gruvbox_contrast_dark='hard'
    let g:gruvbox_invert_selection=0


    let ayucolor='mirage'
    lua require('colorbuddy').colorscheme('gruvbuddy')
    set termguicolors

    let g:dracula_bold = 1
    let g:dracula_italic = 0
    let g:doom_one_transparent_background=v:true
    let g:doom_one_cursor_coloring=v:false
    "colorscheme gruvbox
    "colorscheme base16-nord
    "colorscheme gruvbox8_hard
    "colorscheme doom-one
    "colorscheme codesmell_dark
    "colorscheme spacegray
    "colorscheme ariake
    "colorscheme ariake-dark
    "colorscheme apprentice

    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif

    " color of the ruler
    highlight ColorColumn ctermbg=0 guibg=#313335

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
    if g:colors_name == 'default'
        set t_Co=8
        set t_md=
        highlight Pmenu ctermbg=gray guibg=gray
        "let g:lightline.colorscheme = '16color'
    endif

endfun

call ColorMyPencils()
"call MyDoomColorScheme()

" =====================================================================================================================
" BARBAR CONFIG
" =====================================================================================================================

function BarbarSetup()
   let fg_target = 'red'

   let fg_current  = s:fg(['Normal'], '#efefef')
   let fg_visible  = s:fg(['TabLineSel'], '#efefef')
   let fg_inactive = s:fg(['TabLineFill'], '#888888')

   let fg_modified = s:fg(['WarningMsg'], '#E5AB0E')
   let bg_inactive = s:bg(['TabLineFill', 'StatusLine'], '#000000')

   let fg_special  = s:fg(['Special'], '#599eff')
   let fg_subtle   = s:fg(['NonText', 'Comment'], '#555555')

   let bg_current  = s:bg(['Normal'], '#000000')
   let bg_visible  = s:bg(['TabLineSel', 'Normal'], '#000000')

   " for nisha colorscheme
   if g:colors_name == "nisha"
       let fg_modified = "#E5AB0E"
   endif

   if g:colors_name == "darcula"
       let fg_inactive = '#7c7c7f'
   endif

   if g:colors_name == "apprentice"
       let fg_inactive = "#E5AB0E"
   endif

   if g:colors_name == "nord"
       let fg_modified = "#E5AB0E"
   endif

   "      Current: current buffer
   "      Visible: visible but not current buffer
   "     Inactive: invisible but not current buffer
   "        -Icon: filetype icon
   "       -Index: buffer index
   "         -Mod: when modified
   "        -Sign: the separator between buffers
   "      -Target: letter in buffer-picking mode

   call s:hi_all([
   \ ['BufferCurrent',        fg_current,  bg_current],
   \ ['BufferCurrentIndex',   fg_special,  bg_current],
   \ ['BufferCurrentMod',     fg_modified, bg_current],
   \ ['BufferCurrentSign',    fg_special,  bg_current],
   \ ['BufferCurrentTarget',  fg_target,   bg_current,   'bold'],
   \ ['BufferVisible',        fg_visible,  bg_visible],
   \ ['BufferVisibleIndex',   fg_visible,  bg_visible],
   \ ['BufferVisibleMod',     fg_modified, bg_visible],
   \ ['BufferVisibleSign',    fg_visible,  bg_visible],
   \ ['BufferVisibleTarget',  fg_target,   bg_visible,   'bold'],
   \ ['BufferInactive',       fg_inactive, bg_inactive],
   \ ['BufferInactiveIndex',  fg_subtle,   bg_inactive],
   \ ['BufferInactiveMod',    fg_modified, bg_inactive],
   \ ['BufferInactiveSign',   fg_subtle,   bg_inactive],
   \ ['BufferInactiveTarget', fg_target,   bg_inactive,  'bold'],
   \ ['BufferTabpages',       fg_special,  bg_inactive, 'bold'],
   \ ['BufferTabpageFill',    fg_inactive, bg_inactive],
   \ ])

   call s:hi_link([
   \ ['BufferCurrentIcon',  'BufferCurrent'],
   \ ['BufferVisibleIcon',  'BufferVisible'],
   \ ['BufferInactiveIcon', 'BufferInactive'],
   \ ])

   lua require'bufferline.icons'.set_highlights()
endfunc

function! s:fg(groups, default)
   for group in a:groups
      let hl = nvim_get_hl_by_name(group,   1)
      if has_key(hl, 'foreground')
         return printf("#%06x", hl.foreground)
      end
   endfor
   return a:default
endfunc

function! s:bg(groups, default)
   for group in a:groups
      let hl = nvim_get_hl_by_name(group,   1)
      if has_key(hl, 'background')
         return printf("#%06x", hl.background)
      end
   endfor
   return a:default
endfunc

function! s:hi_all(groups)
   for group in a:groups
      call call(function('s:hi'), group)
   endfor
endfunc

function! s:hi_link(pairs)
   for pair in a:pairs
      execute 'hi default link ' . join(pair)
   endfor
endfunc

function! s:hi(name, ...)
   let fg = ''
   let bg = ''
   let attr = ''

   if type(a:1) == 3
      let fg   = get(a:1, 0, '')
      let bg   = get(a:1, 1, '')
      let attr = get(a:1, 2, '')
   else
      let fg   = get(a:000, 0, '')
      let bg   = get(a:000, 1, '')
      let attr = get(a:000, 2, '')
   end

   let has_props = v:false

   let cmd = 'hi default ' . a:name
   if !empty(fg) && fg != 'none'
      let cmd .= ' guifg=' . fg
      let has_props = v:true
   end
   if !empty(bg) && bg != 'none'
      let cmd .= ' guibg=' . bg
      let has_props = v:true
   end
   if !empty(attr) && attr != 'none'
      let cmd .= ' gui=' . attr
      let has_props = v:true
   end
   execute 'hi default clear ' a:name
   if has_props
      execute cmd
   end
endfunc

call BarbarSetup()
