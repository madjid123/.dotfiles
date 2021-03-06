local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local apps = require('configuration.apps')
local dpi = require('beautiful').xresources.apply_dpi

local left_panel = function(screen)
  local action_bar_width = dpi(50)
  local panel_content_width = dpi(600)
  local offsetx = dpi(14);
  local offsety = dpi(24)
  local panel =
    wibox {
    screen = screen,
    width = action_bar_width -offsetx ,
    height = screen.geometry.height - offsety,
    x = screen.geometry.x + offsetx/2 ,
    y = screen.geometry.y + offsety/2 ,
    ontop = true,
    bg = beautiful.background.hue_800,
    fg = beautiful.fg_normal,
    shape = gears.shape.rounded_rect,
    shape_args = {dpi(46), dpi(46)}
  }

  panel.opened = false

  panel:struts(
    {
      left = action_bar_width 
    }
  )

  local backdrop =
    wibox {
    ontop = true,
    screen = screen,
    bg = '#00001100',
    type = 'dock',
    x = screen.geometry.x,
    y = screen.geometry.y,
    width = screen.geometry.width,
    height = screen.geometry.height
  }

  function panel:run_rofi()
    _G.awesome.spawn(
      apps.default.rofi,
      false,
      false,
      false,
      false,
      function()
        panel:toggle()
      end
    )
  end

  local openPanel = function(should_run_rofi)
    panel.width = action_bar_width + panel_content_width
    backdrop.visible = true
    panel.visible = false
    panel.visible = true
    panel:get_children_by_id('panel_content')[1].visible = true
    if should_run_rofi then
      panel:run_rofi()
    end
    panel:emit_signal('opened')
  end

  local closePanel = function()
    panel.width = action_bar_width - offsetx
    panel:get_children_by_id('panel_content')[1].visible = false
    backdrop.visible = false
    panel:emit_signal('closed')
  end

  function panel:toggle(should_run_rofi)
    self.opened = not self.opened
    if self.opened then
      openPanel(should_run_rofi)
    else
      closePanel()
    end
  end

  backdrop:buttons(
    awful.util.table.join(
      awful.button(
        {},
        1,
        function()
          panel:toggle()
        end
      )
    )
  )

  panel:setup {
    layout = wibox.layout.align.horizontal,
    nil,
    {
      id = 'panel_content',
      bg = beautiful.background.hue_800,
      widget = wibox.container.background,
      visible = false,
      forced_width = panel_content_width,
      {
        require('layout.left-panel.dashboard')(screen, panel),
        layout = wibox.layout.stack
      }
    },
    require('layout.left-panel.action-bar')(screen, panel, action_bar_width)
  }
  return panel
end

return left_panel
