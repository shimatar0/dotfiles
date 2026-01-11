-- Ctrl+LにESCを割り当てる
vim.keymap.set('' , '<c-j>', '<ESC>') -- Normal, Visual, Operator-pendingに適用
vim.keymap.set('i', '<c-j>', '<ESC>') -- Insertに適用


-- Insert & Command-line モードで Emacs 風移動
vim.keymap.set({ 'i', 'c' }, '<c-b>', '<left>',  { desc = 'Emacs like left' })
vim.keymap.set({ 'i', 'c' }, '<c-f>', '<right>', { desc = 'Emacs like right' })
vim.keymap.set({ 'i', 'c' }, '<c-a>', '<home>',  { desc = 'Emacs like home' })
vim.keymap.set({ 'i', 'c' }, '<c-e>', '<end>',   { desc = 'Emacs like end' })
vim.keymap.set({ 'i', 'c' }, '<c-d>', '<del>',   { desc = 'Emacs like delete' })

-- Normal モードで Emacs 風移動
vim.keymap.set('n', '<c-b>', 'h', { desc = 'Emacs like left' })
vim.keymap.set('n', '<c-f>', 'l', { desc = 'Emacs like right' })
vim.keymap.set('n', '<c-a>', '0', { desc = 'Emacs like home' })
vim.keymap.set('n', '<c-e>', '$', { desc = 'Emacs like end' })

-- Visual モードで Emacs 風移動
vim.keymap.set('v', '<c-b>', 'h', { desc = 'Emacs like left' })
vim.keymap.set('v', '<c-f>', 'l', { desc = 'Emacs like right' })
vim.keymap.set('v', '<c-a>', '0', { desc = 'Emacs like home' })
vim.keymap.set('v', '<c-e>', '$', { desc = 'Emacs like end' })

-- 次/前のタブ (buffer) に移動
vim.keymap.set('n', '<c-l>', '<Cmd>BufferLineCycleNext<CR>', { desc = "Next buffer" })
vim.keymap.set('n', '<c-h>', '<Cmd>BufferLineCyclePrev<CR>', { desc = "Prev buffer" })
