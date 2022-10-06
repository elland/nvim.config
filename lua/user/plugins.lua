-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

local function lsp_colour()
  if next(vim.lsp.get_active_clients()) == nil then
    return '#ec5f67'
  else
    return '#98be65'
  end
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Colour schemes
  use 'mhartington/oceanic-next'
  use 'GustavoPrietoP/doom-themes.nvim'
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "EdenEast/nightfox.nvim"
  use 'shaunsingh/solarized.nvim'
  use 'shaunsingh/nord.nvim'

  -- Completions plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- cmdline completions

  -- Editing aids
  use 'terrortylor/nvim-comment'
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        keywords = {
          TODO = { alt = { "FUTUREWORK", } } 
        }
      }
    end
  }

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  -- Lint
  use 'mfussenegger/nvim-lint'

  -- Snips
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- magit for neovim
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
  }
  use 'nvim-treesitter/playground'

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      'nvim-treesitter/nvim-treesitter'
    } }
  }

  -- Telescope file brizer
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                -- your custom insert mode mappings
              },
              ["n"] = {
                -- your custom normal mode mappings
              },
            },
          },
        },
      }
    end
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  else
    require('nvim_comment').setup()

    require('neogit').setup {
      use_magit_keybindings = false,
      disable_commit_confirmation = true,
    }
    require('nightfox').setup {
      options = {
        -- transparent = true,
        terminal_colors = false,
        dim_inactive = true,
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },
    }
    -- require('lint').linters_by_ft = {
    --   haskell = {'hlint'}
    -- }
    require('lualine').setup {
      options = {
        theme = 'auto',
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'fileformat',
          { 'filename',
            path = 1,
            symbols = {
              modified = ' ●',
            },
          },
        },
        lualine_c = { '' },
        lualine_x = {
          { 'diagnostics',
            icon = ' ',
            color = function()
              return { fg = lsp_colour(), bg = '#192f2a' }
            end,
            separator = { left = '' },
          },
        },
        lualine_y = { 'branch', 'diff' },
        lualine_z = { 'location', 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
    }
  end
end)
