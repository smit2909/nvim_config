local f = function()
    local x = 5
    print(x)
end
function GlobalFunction(opts)
    local position_params = vim.lsp.util.make_position_params()
    print("I am, herererere")
    print(vim.inspect(position_params))
    local new_name = vim.fn.input "New name for this >"
    position_params.newName = new_name
    vim.lsp.buf_request(0, "textDocument/rename", position_params, function(err, method, result)
        print("=========================")
        print("I am in handler")
        print(vim.inspect(result))
        print("=========================")

        if result == nil then return end

        local entries = {}
        if result.changes then
            print("=========================")
            print(" I am in changes")
            print(vim.inspect(result.changes))
            for uri, edits in pairs(result.changes) do
                -- help setqflist
                local buffnr = vim.uri_to_bufnr(uri)
                print(buffnr)
                print(uri)

                for _, edit in ipairs(edits) do
                    local start_line = edit.range.start.line + 1
                    local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]
                    table.insert(entries, {bufnr = buffnr, lnum = edit.range.start.line + 1, col = edit.range.start.character + 1, text = line})
                end
            end
        end
        print("these are the entries")
        print(vim.inspect(entries))
        vim.fn.setqflist(entries, "r")
    end)
end

function HunkToLocation(hunk)
    local location = {}
    location.col = 0
    if hunk.type == 'add' then
        location.lnum = hunk.added.start
        location.text = hunk.added.lines[1]
    elseif hunk.type == 'change' then
        location.lnum = hunk.added.start
        location.text = hunk.added.lines[1]
    elseif hunk.type == 'delete' then
        location.lnum = hunk.removed.start
        location.text = hunk.removed.lines[1]
    end

    location.lnum = hunk.added.start
    return location
end

function Glob()
    local op = require'gitsigns'.get_hunks()
    local filepath = vim.fn.expand('%')
    local output = {}
    for _, x in ipairs(op) do
        local loc = HunkToLocation(x)
        loc.filename = filepath
        table.insert(output, loc)
    end
    print(vim.inspect(output))
    return output
end

function GetTab()
    local tablist = vim.api.nvim_list_tabpages()
    print("All tabs --> ", vim.inspect(tablist))
    local lentabs = #tablist
    if lentabs > 1 then
        vim.api.nvim_command("DiffviewClose")
        return
    end
    vim.api.nvim_command("DiffviewOpen")
    return
end
