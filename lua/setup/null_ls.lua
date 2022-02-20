require("null-ls").setup({
    diagnostics_format = "#{s}: #{m}",
    sources = {
        require("null-ls").builtins.formatting.black.with {extra_args = {"--fast"}}, require("null-ls").builtins.diagnostics.flake8,
        require("null-ls").builtins.formatting.reorder_python_imports,
        require("null-ls").builtins.formatting.clang_format.with {extra_filetypes = {"proto"}},
        require("null-ls").builtins.formatting.lua_format.with {
            extra_args = {"-i", "--no-keep-simple-function-one-line", "--no-break-after-operator", "--column-limit=150", "--break-after-table-lb"}
        }
    }
})
