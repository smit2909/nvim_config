-- Lua
require('ofirkai').setup {
  custom_hlgroups = {
    TSComment = {
      style = 'italic',
    },
    DiagnosticUnderlineError = {
      style = 'undercurl',
    },
    DiagnosticUnderlineWarn = {
      style = 'undercurl',
    },
    DiagnosticUnderlineInfo = {
      style = 'undercurl',
    },
    DiagnosticUnderlineHint = {
      style = 'undercurl',
    },
    DiagnosticVirtualTextError = {
      bg = "#3c2d27"
    },
    DiagnosticVirtualTextWarn = {
      bg = "#3f3423",
    },
    DiagnosticVirtualTextInfo = {
      bg = "#4d4d4d"
    },
    DiagnosticVirtualTextHint = {
      bg = "#1a2b32",
    },
  }
}
