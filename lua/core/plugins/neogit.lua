-- Neogit, magit for neovim
return {
  'NeogitOrg/neogit',
  branch = 'nightly',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',         -- required
    'sindrets/diffview.nvim',        -- optional - Diff integration

    'nvim-telescope/telescope.nvim', -- optional
  },
  opts = {
    graph_style = 'unicode',
    remember_settings = false,
    -- signs = {
    --   -- { CLOSED, OPENED }
    --   hunk = { '>', 'v' },
    --   item = { '', '' },
    --   section = { '', '' },
    -- },
  },
  vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { desc = 'Open neo[g]it, not ma[g]it' }),
}
