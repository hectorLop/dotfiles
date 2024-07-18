local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>pg', function()
    local search_dir = vim.fn.input("Search directory: ", "", "dir")
    -- Append a slash at the end of the directory string
    search_dir = search_dir .. "/"
    require('telescope.builtin').live_grep({ search_dirs = {search_dir} })
end, { noremap = true, silent = true })
