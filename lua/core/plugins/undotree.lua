return 
  { -- Undo that works!
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', "<leader>5", vim.cmd.UndotreeToggle, { desc = "See undo DAG" })
    end
  }
