local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local function optd(d)
  return { noremap = true, silent = true, desc = d}
end

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
keymap('n', '<leader>gg', ':Neogit<CR>', optd("Open git"))

-- Telescope / find,r
keymap('n', '<leader>,', ':Telescope buffers<CR>', optd("Search open buffers"))
keymap('n', '<leader>.', ':Telescope git_files<CR>', optd("Search file in project"))
keymap('n','<leader>fr', ':Telescope oldfiles<CR>', optd("Search open files"))
keymap('n','<leader>ff', ':Telescope current_buffer_fuzzy_find<CR>', optd("Search in buffer"))
keymap('n', '<leader>fw', ':Telescope live_grep<CR>', optd("Search in project files"))

keymap('n', '<leader>ht', ':Telescope colorscheme<CR>', optd("Search colour schemes"))

keymap('n', '<leader>;', ':Telescope commands<CR>', optd("Search all commands"))

keymap('n', '<leader>m', ':Telescope marks<CR>', optd("Search all marks"))

keymap('n', '<leader>lq', ':Telescope quickfix<CR>', optd("Search all quickfix suggestions"))
keymap('n', '<leader>lr', ':Telescope lsp_references<CR>', optd("Search all references"))
keymap('n', '<leader>lc', ':Telescope lsp_incoming_calls<CR>', optd("Search callers"))
keymap('n', '<leader>lh', ':Telescope lsp_outgoing_calls<CR>', optd("Search callees"))
keymap('n', '<leader>ld', ':Telescope lsp_implementations<CR>', optd("Search implementations"))


