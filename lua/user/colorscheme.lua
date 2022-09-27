local colorscheme = "duskfox"
local g = vim.g

-- Nightfox config
require('nightfox').setup {
  options = {
    -- transparent = true,
    terminal_colors = false,
    dim_inactive = true,
    styles = {
      comments = "italic",
      keywords = "bold",
    },
  },
}

local pal = {
  all = {
    -- bg1 = '#1b2b34',
    -- bg2 = '#343d46',
    -- bg3 = '#65737e',
    -- bg4 = '#4f5b66',
    --
    -- red     = '#ec5f67',
    -- green   = '#99c794',
    -- yellow  = '#fac863',
    -- blue    = '#6699cc',
    -- magenta = '#c594c5',
    -- cyan    = '#62b3b2',
    -- orange  = '#f99157',
    -- pink    = '#ab7967',
  },
}

local specs = {
  all = {
    syntax = {
      -- func = 'fg1',
    }
  }
}

local overr = require('nightfox').override
overr.palettes(pal)
overr.specs(specs)


-- Solarized light theme config
g.solarized_italic_comments = true
-- g.solarized_borders = true

-- Nord config
g.nord_contrast = true
g.nord_uniform_diff_background = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
