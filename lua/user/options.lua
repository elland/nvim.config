local o = vim.o
local g = vim.g

o.backup = false
o.clipboard = 'unnamedplus'
o.cmdheight = 2

-- Colours and such
o.termguicolors = true

o.timeoutlen = 500
o.updatetime = 201

-- Number of screen lines to keep above and below cursor
o.scrolloff = 8
o.sidescrolloff = 8

-- Editing
o.number = true
o.numberwidth = 4
o.wrap = false
o.relativenumber = true
o.signcolumn = 'yes:2'
o.listchars = 'trail:·,nbsp:◇,tab:▸ ,eol:¬'
o.cursorline = true

-- so that `` is visible in markdown files
o.conceallevel = 0
-- the encoding written to a file
o.fileencoding = "utf-8"
-- highlight all matches on previous search pattern
o.hlsearch = true
o.mouse = 'a' -- allow mouse in term
o.pumheight = 10 -- popup menu height
o.showmode = false -- no more -- INSERT --
o.smartindent = true

o.expandtab = true
o.tabstop = 2
o.shiftwidth = 0
o.softtabstop = 0
o.list = true
o.clipboard = 'unnamedplus'

-- Case insensitive search until a capital letter or /C is used
o.ignorecase = true
o.smartcase = true

-- Undo and file backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- How many cmd line history items we're keeping
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- prompt small choices inline instead of with popup
vim.opt.shortmess:append "c"

-- vim.cmd [[set iskeyword+=-]]

-- Autocommand that reloads neovim whenever you save this file
-- vim.cmd [[
--   augroup initvim
--     autocmd!
--     autocmd BufWritePost options.lua source <afile>
--   augroup end
-- ]]


-- Neovide fun
o.guifont = "Hasklug Nerd Font Mono"

g.neovide_refresh_rate = 60
g.neovide_refresh_rate_idle = 1
g.neovide_transparency = 0.99
g.neovide_remember_window_size = true
g.neovide_cursor_vfx_mode = "railgun"
