local my_color_schemes = {}
my_color_schemes['solarized-dark'] = {
    vim_mode_bg = '#073642',
    bg = "#073642",
    fg = "#bbc2cf",
    fg_alt = "#5B6268",
    yellow = "#b58900",
    cyan = "#2aa198",
    green = "#859900",
    orange = "#cb4b16",
    magenta = "#d33682",
    blue = "#268bd2",
    red = "#dc322f"
}

my_color_schemes['tomorrow-night'] = {
    vim_mode_bg = "#282a2e",
    bg = "#282a2e",
    fg = "#c5c8c6",
    fg_alt = "#373b41",
    yellow = "#e6c547",
    cyan = "#70c0ba",
    green = "#b5bd68",
    orange = "#de935f",
    magenta = "#b294bb",
    blue = "#81a2be",
    red = "#cc6666"
}

my_color_schemes['monokai-pro'] = {
    vim_mode_bg = "#2D2A2E",
    bg = "#2D2A2E",
    fg = "#FCFCFA",
    fg_alt = "#FCFCFA",
    yellow = "#FFD866",
    cyan = "#78DCE8",
    green = "#A9DC76",
    orange = "#de935f",
    magenta = "#AB9DF2",
    blue = "#FC9867",
    red = "#FF6188"
}

my_color_schemes['nord'] = {
    vim_mode_bg = "#2E3440",
    bg = "#2E3440",
    fg = "#D8DEE9",
    fg_alt = "#E5E9F0",
    yellow = "#EBCB8B",
    cyan = "#88C0D0",
    green = "#A3BE8C",
    orange = "#de935f",
    magenta = "#B48EAD",
    blue = "#81A1C1",
    red = "#BF616A"
}

my_color_schemes['gruvbuddy'] = {
    -- bg = "#282c34",
    vim_mode_bg = "#292e37",
    bg = "#292e37",
    fg = "#c5c8c6",
    fg_alt = "#f2e5bc",
    yellow = "#f8fe7a",
    cyan = "#8abeb7",
    green = "#99cc99",
    orange = "#de935f",
    magenta = "#b294bb",
    blue = "#81a2be",
    red = "#cc6666"
}

my_color_schemes['vscode'] = {
    -- bg = "#007ACC",
    vim_mode_bg = "#16825d",
    bg = "#0063cc",
    fg = "#D8DEE9",
    fg_alt = "#D8DEE9",
    yellow = "#D8DEE9",
    cyan = "#D8DEE9",
    green = "#D8DEE9",
    orange = "#D8DEE9",
    magenta = "#D8DEE9",
    blue = "#D8DEE9",
    red = "#D8DEE9"
}

my_color_schemes['palenight'] = {
    -- bg = "#007ACC",
    vim_mode_bg = "#292d3e",
    bg = "#292d3e",
    fg = "#959dcb",
    fg_alt = "#959dcb",
    yellow = "#ffcb6b",
    cyan = "#89ddff",
    green = "#c3e88d",
    orange = "#D8DEE9",
    magenta = "#c792ea",
    blue = "#82aaff",
    red = "#292d3e"
}

my_color_schemes['gruvbox'] = {
    vim_mode_bg = "#282828",
    bg = "#282828",
    fg = "#ebdbb2",
    fg_alt = '#a89984',
    red = '#cc241d',
    green = '#98971a',
    yellow = '#d79921',
    blue = '#458588',
    magenta = '#b16286',
    cyan = '#689d6a',
    orange = "#D8DEE9"
}

-- Local helper functions
local is_file = function()
    return vim.bo.buftype ~= 'nofile'
end
-- separator = ''
-- separator = ' '
local function split(str, sep)
    local res = {}
    local n = 1
    for w in str:gmatch('([^' .. sep .. ']*)') do
        res[n] = res[n] or w -- only set once (so the blank after a string is ignored)
        if w == '' then n = n + 1 end
        -- step forwards on a blank but not a string
    end
    return res
end

-- main config
local gl = require('galaxyline')
-- local colors = require('galaxyline.themes.colors')['nord']
local colors = my_color_schemes['gruvbuddy']

local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

gls.left[1] = {
    RainbowRed = {
        -- provider = function() return '▊ ' end,
        provider = function()
            return '  '
        end,
        highlight = {colors.blue, colors.vim_mode_bg}
    }
}

-- gls.left[2] = {
-- ViMode = {
-- provider = function()
---- auto change color according the vim mode
-- local mode_color = {n = colors.red, i = colors.green,v=colors.blue,
-- [''] = colors.blue,V=colors.blue,
-- c = colors.magenta,no = colors.red,s = colors.orange,
-- S=colors.orange,[''] = colors.orange,
-- ic = colors.yellow,R = colors.violet,Rv = colors.violet,
-- cv = colors.red,ce=colors.red, r = colors.cyan,
-- rm = colors.cyan, ['r?'] = colors.cyan,
-- ['!']  = colors.red,t = colors.red}
-- vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
----return '  '
-- return '  '
-- end,
-- highlight = {colors.red,colors.bg,'bold'},
-- },
-- }

gls.left[2] = {
    ViMode = {
        provider = function()
            local alias = {
                n = 'NORMAL',
                i = 'INSERT',
                c = 'COMMAND',
                V = 'VISUAL',
                [''] = 'VISUAL',
                v = 'VISUAL',
                c = 'COMMAND-LINE',
                ['r?'] = ':CONFIRM',
                rm = '--MORE',
                R = 'REPLACE',
                Rv = 'VIRTUAL',
                s = 'SELECT',
                S = 'SELECT',
                ['r'] = 'HIT-ENTER',
                [''] = 'SELECT',
                t = 'TERMINAL',
                ['!'] = 'SHELL'
            }
            local mode_color = {
                n = colors.red,
                i = colors.green,
                v = colors.blue,
                [''] = colors.blue,
                V = colors.blue,
                c = colors.magenta,
                no = colors.red,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.violet,
                Rv = colors.violet,
                cv = colors.red,
                ce = colors.red,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.red,
                t = colors.red
            }
            local vim_mode = vim.fn.mode()
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim_mode])
            return alias[vim_mode] .. " "
        end,
        -- highlight = {colors.red, "#16825d", 'bold'}
        highlight = {colors.red, colors.vim_mode_bg}
    }
}

gls.left[3] = {
    VScodeblue = {
        -- provider = function() return '▊ ' end,
        provider = function()
            return '  '
        end,
        highlight = {colors.blue, colors.bg}
    }
}

gls.left[4] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = {require('galaxyline.providers.fileinfo').get_file_icon_color, colors.bg}
    }
}

gls.left[5] = {
    FilePath = {
        provider = function()
            local fp = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.:h')
            local tbl = split(fp, '/')
            local len = #tbl

            if len > 2 and not len == 3 and not tbl[0] == '~' then
                return '…/' .. table.concat(tbl, '/', len - 1) .. '/' -- shorten filepath to last 2 folders
                -- alternative: only 1 containing folder using vim builtin function
                -- return '…/' .. vim.fn.fnamemodify(vim.fn.expand '%', ':p:h:t') .. '/'
            else
                return fp .. '/'
            end
        end,
        condition = condition.buffer_not_empty,
        -- highlight = { colors.magenta, colors.bg, 'bold' },
        highlight = {colors.magenta, colors.bg}
    }
}

gls.left[6] = {
    FileName = {
        provider = 'FileName',
        condition = condition.buffer_not_empty,
        -- highlight = {colors.magenta, colors.bg,'bold'}
        highlight = {colors.magenta, colors.bg}
    }
}

gls.left[7] = {
    EmptySpace = {
        -- provider = function() return ' ▊' end,
        provider = function()
            return '  '
        end,
        highlight = {colors.blue, colors.bg}
    }
}

gls.left[8] = {LineInfo = {provider = 'LineColumn', separator = ' ', separator_highlight = {'NONE', colors.bg}, highlight = {colors.fg, colors.bg}}}

gls.left[9] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        -- highlight = {colors.fg,colors.bg,'bold'},
        highlight = {colors.fg, colors.bg}
    }
}

gls.left[10] = {DiagnosticError = {provider = 'DiagnosticError', icon = '  ', highlight = {colors.red, colors.bg}}}

gls.left[11] = {DiagnosticWarn = {provider = 'DiagnosticWarn', icon = '  ', highlight = {colors.yellow, colors.bg}}}

gls.left[12] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        -- icon = '  ',
        icon = '  ',
        highlight = {colors.cyan, colors.bg}
    }
}

gls.left[13] = {DiagnosticInfo = {provider = 'DiagnosticInfo', icon = '  ', highlight = {colors.blue, colors.bg}}}

-- gls.mid[1] = {
-- ShowLspClient = {
-- provider = 'GetLspClient',
-- condition = function ()
-- local tbl = {['dashboard'] = true,['']=true}
-- if tbl[vim.bo.filetype] then
-- return false
-- end
-- return true
-- end,
-- icon = ' LSP:',
-- highlight = {colors.cyan,colors.bg,'bold'}
-- }
-- }

gls.right[1] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        -- highlight = {colors.green,colors.bg,'bold'}
        highlight = {colors.green, colors.bg}
    }
}

gls.right[2] = {
    FileFormat = {
        provider = 'FileFormat',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        -- highlight = {colors.green,colors.bg,'bold'}
        highlight = {colors.green, colors.bg}
    }
}

gls.right[3] = {
    GitIcon = {
        -- provider = function() return '  ' end,
        provider = function()
            return "  "
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        -- highlight = {colors.violet,colors.bg,'bold'},
        highlight = {colors.violet, colors.bg}
    }
}

gls.right[4] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        -- highlight = {colors.violet,colors.bg,'bold'},
        highlight = {colors.violet, colors.bg}
    }
}

gls.right[5] = {
    EmptySpace = {
        -- provider = function() return ' ▊' end,
        provider = function()
            return '  '
        end,
        highlight = {colors.blue, colors.bg}
    }
}

gls.right[6] = {DiffAdd = {provider = 'DiffAdd', condition = condition.hide_in_width, icon = '  ', highlight = {colors.green, colors.bg}}}
gls.right[7] = {
    DiffModified = {provider = 'DiffModified', condition = condition.hide_in_width, icon = ' 柳', highlight = {colors.orange, colors.bg}}
}
gls.right[8] = {DiffRemove = {provider = 'DiffRemove', condition = condition.hide_in_width, icon = '  ', highlight = {colors.red, colors.bg}}}

gls.right[9] = {
    EmptySpace = {
        -- provider = function() return ' ▊' end,
        provider = function()
            return '  '
        end,
        highlight = {colors.blue, colors.bg}
    }
}

gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        -- highlight = {colors.blue,colors.bg,'bold'}
        highlight = {colors.blue, colors.bg}
    }
}

gls.short_line_left[2] = {
    SFileName = {
        provider = 'SFileName',
        condition = condition.buffer_not_empty,
        -- highlight = {colors.fg,colors.bg,'bold'}
        highlight = {colors.fg, colors.bg}
    }
}

gls.short_line_right[1] = {BufferIcon = {provider = 'BufferIcon', highlight = {colors.fg, colors.bg}}}
