-- luacheck: globals vim

-- In normal mode we don't want <Space> to keep advancing cursor so map space to noop
vim.keymap.set("n", "<Space>", "<nop>", { noremap = true })

-- window related mappings
vim.keymap.set("n", "<Leader>wj", "<cmd>wincmd j<CR>", { desc = "Window below" })
vim.keymap.set("n", "<Leader>wk", "<cmd>wincmd k<CR>", { desc = "Window above" })
vim.keymap.set("n", "<Leader>wl", "<cmd>wincmd l<CR>", { desc = "Window right" })
vim.keymap.set("n", "<Leader>wh", "<cmd>wincmd h<CR>", { desc = "Window left" })
vim.keymap.set("n", "<Leader>wv", "<cmd>wincmd v<CR>", { desc = "Split vertical" })
vim.keymap.set("n", "<Leader>ws", "<cmd>wincmd s<CR>", { desc = "Split horizontal" })
vim.keymap.set("n", "<Leader>wd", "<cmd>wincmd c<CR>", { desc = "Close window" })

-- open stuff
vim.keymap.set("n", "<Leader>oq", "<cmd>copen<CR>", { desc = "Quickfix" })
vim.keymap.set("n", "<Leader>od", vim.diagnostic.open_float, { desc = "Diagnostic float" })

-- Buffer operations
-- Deletes buffer but preserves the window.
-- Works by first switching to the another buffer and then deleting the last one.
-- See `:help bd` and `:help ls` to see what `#` flag means.
vim.keymap.set("n", "<Leader>bd", "<cmd>bp|bd#<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<Leader>bD", "<cmd>bp|bd!#<CR>", { desc = "Delete buffer (force)" })

-- Tab related stuff
vim.keymap.set("n", "<Leader><TAB>n", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<Leader><TAB>d", "<cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<Leader><TAB>]", "<cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<Leader><TAB>[", "<cmd>tabprevious<CR>", { desc = "Previous tab" })

-- Clears highlights on search when pressing <Esc> in normal
-- See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- More intuitive way of exitting terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Back to normal mode in terminal", noremap = true })
