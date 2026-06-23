#!/usr/bin/env bash
# Toggle animazioni Hyprland (config Lua / non-legacy parser).
# Con config Lua, "hyprctl keyword" non funziona piu':
# bisogna passare per "hyprctl eval" e richiamare l'API hl.*.

CURRENT_STATE=$(hyprctl getoption animations:enabled | awk 'NR==1 {print $2}')

if [ "$CURRENT_STATE" = "1" ] || [ "$CURRENT_STATE" = "true" ]; then
  hyprctl eval 'hl.config({ animations = { enabled = false } })'
else
  hyprctl eval 'hl.config({ animations = { enabled = true } })'
fi
