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


vim.keymap.set('n', '<Leader>t', function() 
	print('testing!')
end)


