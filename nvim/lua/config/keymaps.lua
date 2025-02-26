-- In normal mode we don't want <Space> to keep advancing cursor so map space to noop
vim.keymap.set('n', '<Space>', '<nop>', {noremap = true})
	
-- window related mappings
vim.keymap.set('n', '<Leader>wj', '<cmd>wincmd j<CR>', {desc = 'Window below'})
vim.keymap.set('n', '<Leader>wk', '<cmd>wincmd k<CR>', {desc = 'Window above'})
vim.keymap.set('n', '<Leader>wl', '<cmd>wincmd l<CR>', {desc = 'Window right'})
vim.keymap.set('n', '<Leader>wh', '<cmd>wincmd h<CR>', {desc = 'Window left'})
vim.keymap.set('n', '<Leader>wv', '<cmd>wincmd v<CR>', {desc = 'Split vertical'})
vim.keymap.set('n', '<Leader>ws', '<cmd>wincmd s<CR>', {desc = 'Split horizontal'})
vim.keymap.set('n', '<Leader>wd', '<cmd>wincmd c<CR>', {desc = 'Close window'})

-- Buffer operations
-- Deletes buffer but preserves the window. Works by first switching to the another buffer and then deleting the last one. 
-- See `:help bd` and `:help ls` to see what `#` flag means.
vim.keymap.set('n', '<Leader>bd', '<cmd>bp|bd#<CR>', {desc = 'Delete buffer'})

-- Clears highlights on search when pressing <Esc> in normal
-- See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

