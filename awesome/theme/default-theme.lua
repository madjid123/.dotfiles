local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi
local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.font = 'Poppins Bold 10'

-- Colors Pallets

-- Primary
theme.primary = mat_colors.orange

-- Accent
theme.accent = mat_colors.pink

-- Background
theme.background = mat_colors.hue_green

local awesome_overrides =
  function(theme)
  theme.dir = os.getenv('HOME') .. '/.config/awesome/theme'
  --theme.dir             = os.getenv("HOME") .. "/code/awesome-pro/themes/pro-dark"

  theme.icons = theme.dir .. '/icons/'
  --theme.wallpaper = theme.dir .. '/wallpapers/pro-dark-shadow.png'
  theme.wallpaper = '~/Pictures/Wallpapers/wallpapers/wallpapers/abstract/lucas.jpg'
  theme.font = 'Poppins 10'
  theme.title_font = 'Poppins bold 12'

  theme.fg_normal = '#868686DE'

  theme.fg_focus  = '#ffffff'
  theme.fg_urgent = '#CC9393'
  theme.bat_fg_critical = '#232323'

  theme.bg_normal = theme.background.hue_900
  theme.bg_focus = '#BEBEBE'
  theme.bg_urgent = '#3F3F3F'
  theme.bg_systray = theme.background.hue_200

  -- Borders

  theme.border_width = dpi(16)
  theme.border_normal = theme.background.hue_800
  theme.border_focus = theme.accent.hue_300
  theme.border_marked = '#8F0808'

  -- Menu

  theme.menu_height = dpi(16)
  theme.menu_width = dpi(600)
  

  -- Tooltips
  theme.tooltip_bg = '#232323'
  --theme.tooltip_border_color = '#232323'
  theme.tooltip_border_width = 1
  theme.tooltip_shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, dpi(16))
  end

  -- Layout

  theme.layout_max = theme.icons .. 'layouts/arrow-expand-all.png'
  theme.layout_tile = theme.icons .. 'layouts/view-quilt.png'

  -- Taglist

  theme.taglist_bg_empty = theme.background.hue_700
  theme.taglist_bg_occupied = theme.background.hue_900
  theme.taglist_bg_urgent =
    'linear:0,0:' ..
    dpi(48) ..
      ',0:0,' ..
        theme.accent.hue_500 ..
          ':0.08,' .. theme.accent.hue_500 .. ':0.08,' .. theme.background.hue_800 .. ':1,' .. theme.background.hue_800
  theme.taglist_bg_focus =
    'linear:0,0:' ..
    dpi(48) ..
      ',0:0,' ..
        theme.accent.hue_400 ..
          ':0.08,' .. theme.accent.hue_400 .. ':0.8,' .. theme.accent.hue_900.. ':1,' .. theme.background.hue_800

  -- Tasklist

  theme.tasklist_font = 'Poppins bold 10'
  theme.tasklist_bg_normal = theme.background.hue_900
  theme.tasklist_bg_focus =
    'linear:0,0:0,' ..
    dpi(48) ..
      ':0,' ..
        theme.primary.hue_600 ..
          ':0.95,' .. theme.primary.hue_900 .. ':0.95,' .. theme.fg_normal .. ':1,' .. theme.fg_normal
  theme.tasklist_bg_urgent = theme.primary.hue_800
  --theme.tasklist.bg_focus = '#444444'

  theme.tasklist_fg_focus = theme.accent.hue_50
  theme.tasklist_fg_urgent = theme.fg_urgent
  theme.tasklist_fg_normal = '#D4D4D4'

  theme.icon_theme = 'Papirus-Dark'

  --Client
  theme.border_width = dpi(1)
  theme.border_focus = theme.primary.hue_500
  theme.border_normal = theme.background.hue_800
end
return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
