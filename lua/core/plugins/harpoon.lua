-- Harpoon, improved marks
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      settings = {
        save_on_toggle = true,
      },
    }

    local smap = function(keys, func, buf)
      vim.keymap.set('n', keys, func, { buffer = buf })
    end

    local map = function(key, func, desc)
      vim.keymap.set('n', key, func, { desc = desc })
    end

    harpoon:extend {
      UI_CREATE = function(cx)
        smap('<C-v>', function()
          harpoon.ui:select_menu_item { vsplit = true }
        end, cx.bufnr)

        smap('<C-x>', function()
          harpoon.ui:select_menu_item { split = true }
        end, cx.bufnr)

        smap('<C-t>', function()
          harpoon.ui:select_menu_item { tabedit = true }
        end, cx.bufnr)
      end,
    }

    -- map('<leader>hm', ':Telescope harpoon marks<CR>', 'Open harpoon marks')

    map('<leader>a', function()
      harpoon:list():add()
    end, 'Add current buffer to harpoon')
    map('<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, 'List buffers with harpoon')

    map('<leader>1', function()
      harpoon:list():select(1)
    end, 'Jump to 1')
    map('<leader>2', function()
      harpoon:list():select(2)
    end, 'Jump to 2')
    map('<leader>3', function()
      harpoon:list():select(3)
    end, 'Jump to 3')
    map('<leader>4', function()
      harpoon:list():select(4)
    end, 'Jump to 6')
  end,
}
