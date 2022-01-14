local actions = require('telescope.actions')
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local conf = require("telescope.config").values

require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

function set_background(content)
    vim.fn.system("gsettings set org.gnome.desktop.background picture-uri file:///".. content .."")
end

require('telescope').load_extension('fzy_native')

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "~/.config/nvim/plugin",
    })
end

local function select_background(prompt_bufnr, map)
    local function set_the_background(close)
        local content =
        require('telescope.actions.state').get_selected_entry(prompt_bufnr)
        set_background(content.cwd .. "/" .. content.value)
        if close then
            require('telescope.actions').close(prompt_bufnr)
        end
    end

    map('i', '<C-p>', function()
        set_the_background()
    end)

    map('i', '<CR>', function()
        set_the_background(true)
    end)
end

local function image_selector(prompt, cwd)
    return function()
        require("telescope.builtin").find_files({
            prompt_title = prompt,
            cwd = cwd,

            attach_mappings = function(prompt_bufnr, map)
                select_background(prompt_bufnr, map)

                -- Please continue mapping (attaching additional key maps):
                -- Ctrl+n/p to move up and down the list.
                return true
            end
        })
    end
end

M.anime_selector = image_selector("< Select Wallpaper > ", "~/Downloads/wallpapers")

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end

M.my_picker = function (opts)
    -- this is the exact picker from source code of telescope nvim, with a few modification to server_results
  local params = vim.lsp.util.make_position_params()
  params.context = { includeDeclaration = true }

  local results_lsp, err = vim.lsp.buf_request_sync(0, "textDocument/references", params, 10000)
  if err then
    vim.api.nvim_err_writeln("Error when finding references: " .. err)
    return
  end

  local locations = {}
  local new_server_result = {}

  local filepath = vim.fn.expand('%')
  local folder, filename, extension = filepath:match("^(.-)([^\\/]-)%.([^\\/%.]-)%.?$")

  for _, server_results in pairs(results_lsp) do
    if server_results.result then
        --print(folder)
        --for _, edits in ipairs(server_results.result) do
            --if string.find(edits.uri, folder) then
                --print("==========")
                --print(edits.uri)
                --print(folder)
                --print("==========")
            --end
        --end
        new_server_result = vim.tbl_filter(
        function(r)
            return string.find(r.uri, folder, 1, true)
        end, server_results.result)
        print("Number of references in "..folder.." > "..#new_server_result)
      vim.list_extend(locations, vim.lsp.util.locations_to_items(new_server_result) or {})
    end
  end

  if vim.tbl_isempty(locations) then
    return
  end
  -- print(vim.inspect(locations))

  pickers.new(opts, {
    prompt_title = "Filtered LSP References",
    finder = finders.new_table {
      results = locations,
      entry_maker = opts.entry_maker or make_entry.gen_from_quickfix(opts),
    },
    previewer = conf.qflist_previewer(opts),
    sorter = conf.generic_sorter(opts),
  }):find()
end

local function HunkToLocation(hunk)
    local location = {}
    location.col = 0
    if hunk.type == 'add' then
        location.lnum = hunk.added.start
        location.text = 'Added: ' .. hunk.added.lines[1]
    elseif hunk.type == 'change' then
        location.lnum = hunk.added.start
        location.text = 'Changed: ' .. hunk.added.lines[1]
    elseif hunk.type == 'delete' then
        location.lnum = hunk.removed.start
        location.text = 'Deleted: ' .. hunk.removed.lines[1]
    end

    location.lnum = hunk.added.start
    return location
end

local function ChangedHunks()
    local op = require'gitsigns'.get_hunks()
    local filepath = vim.fn.expand('%')
    local output = {}

    if op == nil then
        return output
    end

    for _, x in ipairs(op) do
        local loc = HunkToLocation(x)
        loc.filename = filepath
        table.insert(output, loc)
    end
    return output
end

M.hunk_picker = function (opts)

  local locations = ChangedHunks()

  if vim.tbl_isempty(locations) then
    return
  end
  -- print(vim.inspect(locations))

  pickers.new(opts, {
    prompt_title = "Changed Hunks",
    finder = finders.new_table {
      results = locations,
      entry_maker = opts.entry_maker or make_entry.gen_from_quickfix(opts),
    },
    previewer = conf.qflist_previewer(opts),
    sorter = conf.generic_sorter(opts),
  }):find()
end

return M
