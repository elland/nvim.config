local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local function optd(d)
  return { noremap = true, silent = true, desc = d }
end

keymap.set("n", "<ESC><ESC>", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>ta", "<cmd>tabo<CR>", { desc = "Close all but curr ent tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Normal --
-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

keymap.set('n', "<leader>scd", ":cd %:p:h<CR>", optd("Set working directory"))


keymap.set("n", "<leader>bk", ":bd<CR>", optd("Kill current buffer"))
keymap.set("n", "<leader>ba", ":%bd|e#|bd#<CR>", optd("Kill all but buffer"))


-- Telescope / finder
keymap.set('n', '<leader>.', ':Telescope git_files<CR>', optd("Search git tracked files in project"))
keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', optd("Search file in project"))
keymap.set('n', '<leader>fr', ':Telescope oldfiles<CR>', optd("Search open files"))
keymap.set('n', '<leader>ff', ':Telescope current_buffer_fuzzy_find<CR>', optd("Search in buffer"))
keymap.set('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", optd("Search open buffers"))


keymap.set('n', '<leader>ht', ':Telescope colorscheme<CR>', optd("Search colour schemes"))
keymap.set('n', '<leader>;', ':Telescope commands<CR>', optd("Search all commands"))
keymap.set('n', '<leader>m', ':Telescope marks<CR>', optd("Search all marks"))


---- Telescope + LSP
keymap.set('n', '<leader>lq', ':Telescope quickfix<CR>', optd("Search all quickfix suggestions"))
keymap.set('n', '<leader>lr', ':Telescope lsp_references<CR>', optd("Search all references"))
keymap.set('n', '<leader>lc', ':Telescope lsp_incoming_calls<CR>', optd("Search callers"))
keymap.set('n', '<leader>lh', ':Telescope lsp_outgoing_calls<CR>', optd("Search callees"))
keymap.set('n', '<leader>ld', ':Telescope lsp_implementations<CR>', optd("Search implementations"))


keymap.set('n', '<space>f', "<cmd>lua vim.lsp.buf.format()<CR>", optd("Format buffer"))
keymap.set('n', '<space>q', ":!ormolu -i %<CR>", optd("Format buffer with ormolu"))
