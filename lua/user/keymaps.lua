local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

local function optd(d)
  return { noremap = true, silent = true, desc = d }
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

keymap('n', "<leader>scd", ":cd %:p:h<CR>", optd("Set working directory"))

-- Resize with arrows
keymap("n", "˚", ":resize +2<CR>", opts)
keymap("n", "∆", ":resize -2<CR>", opts)
keymap("n", "¬", ":vertical resize +2<CR>", opts)
keymap("n", "˙", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<D-k>", ":bnext<CR>", opts)
keymap("n", "<D-j>", ":bprevious<CR>", opts)
keymap("n", "<leader>bk", ":bd<CR>", optd("Kill current buffer"))
keymap("n", "<leader>ba", ":%bd|e#|bd#<CR>", optd("Kill all but buffer"))

-- Insert --
-- Press jk fast to enter normal mode
keymap("i", "jk", "<ESC>", opts)

-- neogit (magit)
keymap('n', '<leader>gg', ':Neogit<CR>', optd("Open git"))

-- Telescope / finder
keymap('n', '<leader>,', ':Telescope buffers<CR>', optd("Search open buffers"))
keymap('n', '<leader>.', ':Telescope git_files<CR>', optd("Search file in project"))
keymap('n', '<leader>fr', ':Telescope oldfiles<CR>', optd("Search open files"))
keymap('n', '<leader>ff', ':Telescope current_buffer_fuzzy_find<CR>', optd("Search in buffer"))
keymap('n', '<leader>fw', ':Telescope live_grep<CR>', optd("Search in project files"))
keymap('n', '<leader>fb', ':Telescope buffers<CR>', optd("Search in open buffers"))

keymap('n', '<leader>ht', ':Telescope colorscheme<CR>', optd("Search colour schemes"))

keymap('n', '<leader>;', ':Telescope commands<CR>', optd("Search all commands"))

keymap('n', '<leader>m', ':Telescope marks<CR>', optd("Search all marks"))

keymap('n', '<ESC><ESC>', ':nohlsearch<CR>', opts)

---- Telescope + LSP
keymap('n', '<leader>lq', ':Telescope quickfix<CR>', optd("Search all quickfix suggestions"))
keymap('n', '<leader>lr', ':Telescope lsp_references<CR>', optd("Search all references"))
keymap('n', '<leader>lc', ':Telescope lsp_incoming_calls<CR>', optd("Search callers"))
keymap('n', '<leader>lh', ':Telescope lsp_outgoing_calls<CR>', optd("Search callees"))
keymap('n', '<leader>ld', ':Telescope lsp_implementations<CR>', optd("Search implementations"))

-- LSP

keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", optd("Set location list in window")) -- what?

keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", optd("Go to declaration"))
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", optd("Go to definition"))
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR><cmd>lua vim.lsp.buf.hover()<CR>", optd("Hover type info"))
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", optd("Go to implementation"))
keymap("n", "<leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", optd("Show signature help"))
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", optd("Rename"))
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", optd("Show references"))
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", optd("Code actions"))
keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float()<CR>", optd("Show diagnostics"))
keymap("n", "]e", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', optd("Go to next issue"))
keymap("n", "[e", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', optd("Go to previous issue"))
keymap('n', '<space>f', "<cmd>lua vim.lsp.buf.format()<CR>", optd("Format buffer"))
keymap('n', '<space>q', ":!ormolu -i %<CR>", optd("Format buffer with ormolu"))

vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
