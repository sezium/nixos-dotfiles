# TODO fix this
# Short xdg-mime tutorial:
#
# xdg-mime query filetype <file> to get the mimetype of <file>
# see available .desktop files in /run/current-system/sw/share/applications (or others from $XDG_DATA_DIRS)
# use xdg-mime default <programname>.desktop <mimetype> to change the default program, e.g. xdg-mime default firefox.desktop text/plain
# Mime type for HTTP and HTTPS is x-scheme-handler/http and x-scheme-handler/https
# The reason your command doesn’t work is because the evince .desktop file was renamed to org.gnome.Evince.desktop, so this command should work:
{
  # Set default applications for image and media types
  xdg.mime = {
    enable = true;

    defaultApplications = {
      "image/png" = "qimgv.desktop";
      "image/jpeg" = "qimgv.desktop";
      "image/gif" = "qimgv.desktop";
      "image/svg+xml" = "qimgv.desktop";

      "video/mp4" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "audio/mpeg" = "mpv.desktop";
      "audio/ogg" = "mpv.desktop";

      "application/pdf" = "org.pwmt.zathura.desktop";
      "inode/directory" = "thunar.desktop";
    };
  };
}
