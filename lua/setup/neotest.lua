local neo = require("neotest")
neo.setup({
    adapters = {
        require("neotest-go")

    },
    status = {
        enabled = true,
        signs = true,
        virtual_text = true
    },
    config = function()
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_text = {
                format = function(diagnostic)
                    local message = diagnostic.message
                        :gsub("\n", " ")
                        :gsub("\t", " ")
                        :gsub("%s+", " ")
                        :gsub("^%s+", "")
                    return message
                end,
            },
        }, neotest_ns)
    end,
    icons = {
        child_indent = "│",
        child_prefix = "├",
        collapsed = "─",
        expanded = "╮",
        failed = "🔴",
        final_child_indent = " ",
        final_child_prefix = "╰",
        non_collapsible = "─",
        passed = "🟢",
        running = "⏳",
        running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
        skipped = "❌",
        unknown = "?"
    },
})

local M = {}
local is_test_summary_active = false

M.test_current_dir = function()
    local filepath = vim.fn.expand('%')
    local folder, filename, extension = filepath:match("^(.-)([^\\/]-)%.([^\\/%.]-)%.?$")
    vim.inspect(print(folder))
    neo.run.run(folder)
end

M.toggle_test_summary = function()
    if is_test_summary_active then
        neo.summary.close()
        is_test_summary_active = false
    else
        neo.summary.open()
        is_test_summary_active = true
    end
end
return M
