require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "toml", "yaml", "json", "jsdoc", "bash", "regex", "html", "css", "javascript", "haskell",
                       "typescript", "tsx", "python", "go", "fish", "lua" },
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
  folding = {
      enable = true,
  }
}
