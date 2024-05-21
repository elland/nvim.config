return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  config = function()
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
            -- color = function()
            --   return { fg = lsp_colour(), bg = '#192f2a' }
            -- end,
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
  end,
}
