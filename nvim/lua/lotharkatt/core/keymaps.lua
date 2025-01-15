-- Set leader key to space
vim.g.mapleader = " "


-- VIM HARDMODE
-- Disable arrow keys in normal mode
vim.api.nvim_set_keymap('n', '<Up>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<nop>', { noremap = true, silent = true })

-- Disable arrow keys in insert mode
vim.api.nvim_set_keymap('i', '<Up>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Down>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Left>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', '<nop>', { noremap = true, silent = true })

-- Zenmode
vim.api.nvim_set_keymap("n", "<leader>z", ":ZenMode<CR>", { noremap = true, silent = true })

