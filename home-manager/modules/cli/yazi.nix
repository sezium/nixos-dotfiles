{ pkgs, ...}:
{
  programs.yazi = {
    enable = true;

    settings = {
      mgr = {
        ratio = [1 2 3];
        sort_by = "natural";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;

        linemode = "size";
        show_hidden = false;
        show_symlink = false;
        scrolloff = 255;
      };

      preview = {
        wrap = "no";
        tab_size = 2;
        max_width = 1000;
        max_height = 1500;
        image_quality = 90;
        sixel_friction = 15;
      };
      opener.rules = [
        {
          run = "${pkgs.xdg-utils}/bin/xdg-open $FILE";
        }
      ];

    };
  };
}
