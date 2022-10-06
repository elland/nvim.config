require 'user.plugins'
require 'user.colorscheme'
require 'user.options'
require 'user.keymaps'
require 'user.treesitter'
require 'user.lsp'
require 'user.completion'
require 'user.filetypes'
-- require 'user.evil_lualine'

-- Restore caret position in file
vim.cmd [[
  autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 
]]
