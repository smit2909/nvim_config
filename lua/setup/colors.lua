-- barbar config
vim.g.bufferline = {icons = 'both'}

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
    ignore_buftypes = {nofile = true}
}

-- indent guide config
-- vim.cmd [[highlight IndentBlanklineContextChar guifg=#C678DD gui=nocombine]]

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    -- show_current_context_start = true,
    filetype_exclude = {"dashboard", "nerdtree", "alpha", "packer"}
}
