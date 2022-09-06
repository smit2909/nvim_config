require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "toml", "yaml", "json", "bash", "regex", "html", "css", "python", "go", "lua", "rust" },
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
