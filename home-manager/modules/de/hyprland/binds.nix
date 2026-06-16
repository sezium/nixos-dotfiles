{
    wayland.windowManager.hyprland.settings = {
        bind = [
                "$mainMod, D, exec, $menu"
                "$mainMod, ESCAPE, exit"
                "$mainMod, F, togglefloating"
                "$mainMod, O, togglesplit"
                "$mainMod, P, pseudo"
                "$mainMod, Q, killactive"
                "$mainMod, R, exec, $fileManager"
                "$mainMod, SPACE, fullscreen"
                "$mainMod, T, exec, $terminal"
                "$mainMod, U, exec, $powerMenu"
                "$mainMod, 0, exec, $lockScreen"

                "$mainMod, L, movefocus, l"
                "$mainMod, H, movefocus, r"
                "$mainMod, K, movefocus, u"
                "$mainMod, J, movefocus, d"

                "$mainMod, Z, workspace, 1"
                "$mainMod, X, workspace, 2"
                "$mainMod, C, workspace, 3"
                "$mainMod, V, workspace, 4"
                "$mainMod, B, workspace, 5"
                "$mainMod, N, workspace, 6"
                "$mainMod, M, workspace, 7"

                "$mainMod SHIFT, Z, movetoworkspace, 1"
                "$mainMod SHIFT, X, movetoworkspace, 2"
                "$mainMod SHIFT, C, movetoworkspace, 3"
                "$mainMod SHIFT, V, movetoworkspace, 4"
                "$mainMod SHIFT, B, movetoworkspace, 5"
                "$mainMod SHIFT, N, movetoworkspace, 6"
                "$mainMod SHIFT, M, movetoworkspace, 7"

                "$mainMod SHIFT, H, movewindow, l"
                "$mainMod SHIFT, L, movewindow, r"
                "$mainMod SHIFT, K, movewindow, u"
                "$mainMod SHIFT, J, movewindow, d"

                "$mainMod Alt, l, resizeactive,  40   0"
                "$mainMod Alt, h, resizeactive, -40   0"
                "$mainMod Alt, j, resizeactive,   0  40"
                "$mainMod Alt, k, resizeactive,   0 -40"

                "$mainMod, S, exec, grim -g \"$(slurp -w 0)\" ~/Media/Pictures/screenshots/$(date +'%s')_grim.png"
                "$mainMod, A, exec, ~/scripts/animation.sh"


                "$mainMod, mouse_down, workspace, e+1"
                "$mainMod, mouse_up, workspace, e-1"
                "$mainMod, W, exec, ~/scripts/waybar.sh"

                ];

# Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = [
            "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
        ];

# Laptop multimedia keys for volume and LCD brightness
        bindel = [
            ",XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                ",XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
                ",XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                ",XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
                ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
                ",XF86MonBrightnessUp,   exec, brightnessctl set +5%"
        ];

        bindl = [
            ", XF86AudioNext,  exec, playerctl next"
                ", XF86AudioPause, exec, playerctl play-pause"
                ", XF86AudioPlay,  exec, playerctl play-pause"
                ", XF86AudioPrev,  exec, playerctl previous"
        ];
    };



}
