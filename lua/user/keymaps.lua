local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Map <leader> to comma; most important
keymap("n", ",", "<Nop>", opts)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "˚", ":resize +2<CR>", opts)
keymap("n", "∆", ":resize -2<CR>", opts)
keymap("n", "¬", ":vertical resize -2<CR>", opts)
keymap("n", "˙", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-k>", ":bnext<CR>", opts)
keymap("n", "<S-j>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter normal mode
keymap("i", "jk", "<ESC>", opts)

-- neogit (magit)
keymap('n', '<leader>gg', ':Neogit<CR>', opts)

-- Telescope / find,r
keymap('n', '<leader>fr', ':Telescope oldfiles<CR>', opts)
keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
keymap('n', '<leader>fb', ':Telescope file_browser<CR>', opts)
keymap('n', '<leader>fw', ':Telescope live_grep<CR>', opts)
keymap('n', '<leader>,', ':Telescope buffers<CR>', opts)
keymap('n', '<leader>ht', ':Telescope colorscheme<CR>', opts)

