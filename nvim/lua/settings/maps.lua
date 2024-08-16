local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')
map('n', '<leader>nn', ':NvimTreeToggle<CR>')
