local wezterm = require 'wezterm';

return {
  default_cwd = "~",

  font = wezterm.font("Rec Mono Duotone"),
  font_size = 16,
  line_height = 1.5,

  color_scheme = "OneHalfDark",
  use_fancy_tab_bar = false,

  colors = {
    tab_bar = {
      active_tab = {
        bg_color = "#282c34",
        fg_color = "#dcdfe4",
      }
    }
  },

  keys = {
    -- option -> meta
    { key="Alt", mods="META", action="DisableDefaultAssignment" },

    -- zoom pane
    { key = "Z", mods="ALT|SHIFT", action="TogglePaneZoomState" },

    -- splits
    { key="|", mods="CTRL|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}} },
    { key="_", mods="CTRL|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}} },

    -- switch pane
    { key = "H", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Left"}},
    { key = "J", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Down"}},
    { key = "K", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Up"}},
    { key = "L", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Right"}},

    -- switch tab
    { key="{", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=-1} },
    { key="}", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=1} },
  },
  send_composed_key_when_left_alt_is_pressed=true,
  send_composed_key_when_right_alt_is_pressed=true,
}
