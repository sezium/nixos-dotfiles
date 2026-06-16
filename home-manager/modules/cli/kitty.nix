{
programs.kitty = {
  enable = true;
  shellIntegration.mode = "no-cursor";

  settings = {
    confirm_os_window_close = 0;
    enable_audio_bell = false;

    window_padding_width = "0 0";
    window_margin_width = "0 0";

    cursor_trail = "0"; # ENABLE OR DISABLE CURSOR ANIMATION
    cursor_trail_decay = "0.1 0.4";

    cursor_shape = "block";
    cursor_blink_interval = "0.0";

    mouse_hide_wait = "-1.0";
  };
};
}
