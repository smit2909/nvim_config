lua << EOF
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.black.with{ extra_args = { "--fast" } },
        require("null-ls").builtins.formatting.gofmt,
        require("null-ls").builtins.diagnostics.flake8,
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.reorder_python_imports,
    },
})
EOF
