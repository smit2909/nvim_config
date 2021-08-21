lua <<EOF
-- require("twilight").setup {}
-- require("treesitter-context.config").setup {enable=true}
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"toml", "yaml", "json", "jsdoc", "bash", "regex", "html", "css", "javascript",
                     "typescript", "tsx", "python", "lua"},
  highlight = {
    enable = true,
  },
  goto_next_start = {
    ["]m"] = "@function.outer",
    ["]]"] = "@class.outer",
      },
  goto_next_end = {
    ["]M"] = "@function.outer",
    ["]["] = "@class.outer",
  },
  goto_previous_start = {
    ["[m"] = "@function.outer",
    ["[["] = "@class.outer",
  },
  goto_previous_end = {
    ["[M"] = "@function.outer",
    ["[]"] = "@class.outer",
  },
}
-- pyfold = {
-- enable = true,
-- custom_foldtext = true -- Sets provided foldtext on window where module is active
-- },

EOF
