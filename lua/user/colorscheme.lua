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

-- local pal = {
--   nightfox = {
--     -- bg1 = '#1b2b34',
--     -- bg2 = '#343d46',
--     -- bg3 = '#4f5b66',
--     -- bg4 = '#65737e',
--     -- -- bg4 = '#a7adba',
--     --
--     -- red     = '#ec5f67',
--     -- green   = '#99c794',
--     -- yellow  = '#fac863',
--     -- blue    = '#6699cc',
--     -- magenta = '#c594c5',
--     -- cyan    = '#62b3b2',
--     -- orange  = '#f99157',
--     -- pink    = '#ab7967',
--   },
-- }
--
-- local specs = {
--   nightfox = {
--     syntax = {
--       -- keyword = 'red',
--     }
--   }
-- }
--
local overr = require('nightfox').override
overr.palettes(pal)
overr.specs(specs)

local colorscheme = "nightfox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
