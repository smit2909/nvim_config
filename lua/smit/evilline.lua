local my_colors = {
  bg = '#202328',
  fg = '#bbc2cf',
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef';
  red = '#ec5f67';
  white = '#f2e5bc';
  pink = '#fef601';
  aqua = '#8ec07c';
  buddy_green = '#99cc99';
  buddy_yellow = '#f8fe7a';
  buddy_red = '#cc6666';
  buddy_cyan = '#8abeb7';
  buddy_purple = '#8e6fbd';
  buddy_violet = '#b294bb';
  buddy_orange = '#de935f';
  buddy_brown = '#a3685a';
  buddy_seagreen = '#698b69';
  gruvbox_dark_bg = '#1D2021';
  gruvbox_light_bg = '#3C3836';
  gruvbuddy_bg = '#282c34';
--  gruvbuddish_bg = '#232830';
  gruvbuddish_bg = '#282c34';
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
        if w == '' then
            n = n + 1
        end -- step forwards on a blank but not a string
    end
    return res
end

-- main config
local gl = require('galaxyline')
local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui','packer'}

gls.left[1] = {
  RainbowRed = {
    --provider = function() return '▊ ' end,
    provider = function() return '  ' end,
    highlight = {colors.blue,my_colors.gruvbuddish_bg}
  },
}

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = my_colors.buddy_red, i = my_colors.buddy_green,v=colors.blue,
                          [''] = colors.blue,V=colors.blue,
                          c = my_colors.buddy_purple,no = my_colors.buddy_red,s = my_colors.buddy_orange,
                          S=my_colors.buddy_orange,[''] = my_colors.buddy_orange,
                          ic = my_colors.buddy_yellow,R = colors.violet,Rv = colors.violet,
                          cv = my_colors.buddy_red,ce=my_colors.buddy_red, r = my_colors.buddy_cyan,
                          rm = my_colors.buddy_cyan, ['r?'] = my_colors.buddy_cyan,
                          ['!']  = my_colors.buddy_red,t = my_colors.buddy_red}
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return '  '
    end,
    highlight = {my_colors.buddy_red,my_colors.gruvbuddish_bg,'bold'},
  },
}

gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,my_colors.gruvbuddish_bg},
  },
}

gls.left[4] = {
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
        highlight = { my_colors.buddy_violet, my_colors.gruvbuddish_bg, 'bold' },
    },
}
--gls.left[3] = {
  --FileSize = {
    --provider = 'FileSize',
    --condition = condition.buffer_not_empty,
    --highlight = {colors.fg,my_colors.gruvbuddish_bg}
  --}
--}

gls.left[5] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {my_colors.buddy_violet,my_colors.gruvbuddish_bg,'bold'}
  }
}

gls.left[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',my_colors.gruvbuddish_bg},
    highlight = {colors.fg,my_colors.gruvbuddish_bg},
  },
}

gls.left[7] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',my_colors.gruvbuddish_bg},
    highlight = {colors.fg,my_colors.gruvbuddish_bg,'bold'},
  }
}

gls.left[8] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {my_colors.buddy_red,my_colors.gruvbuddish_bg}
  }
}
gls.left[9] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {my_colors.buddy_yellow,my_colors.gruvbuddish_bg},
  }
}

gls.left[10] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {my_colors.buddy_cyan,my_colors.gruvbuddish_bg},
  }
}

gls.left[11] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.cyan,my_colors.gruvbuddish_bg},
  }
}

--gls.mid[1] = {
  --ShowLspClient = {
    --provider = 'GetLspClient',
    --condition = function ()
      --local tbl = {['dashboard'] = true,['']=true}
      --if tbl[vim.bo.filetype] then
        --return false
      --end
      --return true
    --end,
    --icon = ' LSP:',
    --highlight = {colors.cyan,my_colors.gruvbuddish_bg,'bold'}
  --}
--}

gls.right[1] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',my_colors.gruvbuddish_bg},
    highlight = {my_colors.buddy_cyan,my_colors.gruvbuddish_bg,'bold'}
  }
}

gls.right[2] = {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',my_colors.gruvbuddish_bg},
    highlight = {my_colors.buddy_cyan,my_colors.gruvbuddish_bg,'bold'}
  }
}

gls.right[3] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',my_colors.gruvbuddish_bg},
    highlight = {colors.buddy_violet,my_colors.gruvbuddish_bg,'bold'},
  }
}

gls.right[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {my_colors.buddy_violet,my_colors.gruvbuddish_bg,'bold'},
  }
}

gls.right[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {my_colors.buddy_green,my_colors.gruvbuddish_bg},
  }
}
gls.right[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {my_colors.buddy_orange,my_colors.gruvbuddish_bg},
  }
}
gls.right[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {my_colors.buddy_red,my_colors.gruvbuddish_bg},
  }
}

gls.right[8] = {
  RainbowBlue = {
    --provider = function() return ' ▊' end,
    provider = function() return '  ' end,
    highlight = {colors.blue,my_colors.gruvbuddish_bg}
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',my_colors.gruvbuddish_bg},
    highlight = {colors.blue,my_colors.gruvbuddish_bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,my_colors.gruvbuddish_bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,my_colors.gruvbuddish_bg}
  }
}
