return { -- Toggle Terminal
  'akinsho/toggleterm.nvim',
  version = "*",
  lazy = false,
  keys = {
    {
      '<C-`>',
      function()
        vim.cmd('ToggleTerm')
      end,
      mode = 'n',
      desc = 'Toggle terminal',
    },
    {
      '<C-`>',
      function()
        vim.cmd('ToggleTerm')
      end,
      mode = 't',
      desc = 'Toggle terminal from terminal mode',
    },
  },
  opts = {
    open_mapping = [[<C-`>]],
    direction = "horizontal",
    size = 20,
    close_on_exit = true,
    start_in_insert = true,
    shade_terminals = true,
    hide_numbers = true,
  },
}
