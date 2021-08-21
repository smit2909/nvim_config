lua << EOF
require('telescope').setup{ defaults={file_ignore_patterns = {"migrations"}} }
-- require('telescope').load_extension('coc')

changed_on_branch = function()
    local previewers = require('telescope.previewers')
    local pickers = require('telescope.pickers')
    local sorters = require('telescope.sorters')
    local finders = require('telescope.finders')

    pickers.new {
        results_title = 'Modified on current branch',
        finder = finders.new_oneshot_job({'bash', '/home/smit/personal/myscripts/git_branch_modified.sh', 'list'}),
        sorter = sorters.get_fuzzy_file(),
        previewer = previewers.new_termopen_previewer {
            get_command = function(entry)
                return {'bash', '/home/smit/personal/myscripts/git_branch_modified.sh', 'diff', entry.value}
            end
        },
    }:find()
end

local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')
local conf = require('telescope.config')
local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
    -- this is for status
    -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
    -- just do an if and return a different command
    if entry.status == '??' or 'A ' then
      return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value }
    end

    -- note we can't use pipes
    -- this command is for git_commits and git_bcommits
    return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!' }

  end
}

my_git_status = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_status(opts)
end

EOF

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
nnoremap <A-b> :lua require('telescope.builtin').lsp_document_symbols()<CR>
nnoremap <leader>s :lua require('telescope.builtin').lsp_document_diagnostics()<CR>
"nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

" show changed_on_branch
nnoremap <leader>pb :lua changed_on_branch()<CR>
"nnoremap <leader>pb :lua my_git_status()<CR>

nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('smit.telescope').search_dotfiles()<CR>
nnoremap <leader>va :lua require('smit.telescope').anime_selector()<CR>

" moved from coc.vim to here
"nnoremap <silent>gd :Telescope coc definitions<CR>
"nnoremap <silent>gr :Telescope coc references<CR>
