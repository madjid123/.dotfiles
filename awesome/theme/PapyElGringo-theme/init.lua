local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local dpi = require('beautiful').xresources.apply_dpi

local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.font = 'Poppins 10'

-- Colors Pallets

-- Primary
theme.wallpaper = "#172124"
theme.primary = mat_colors.deep_orange

-- Accent
theme.accent = mat_colors.teal

-- Background
theme.background = mat_colors.grey

-- theme.background.hue_800 = '#26272E'
--theme.background.hue_900 = '#121e25'

local awesome_overrides = function(theme)
  --
end
return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
