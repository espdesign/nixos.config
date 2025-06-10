{
  lib,
  pkgs,
  ...
}: {
  # framework specific home settings

  programs.ghostty.font-size = 16;
  dconf = {
    enable = true;
    settings = {
      # To help find the location and setting of the database,
      # use the following command to see what settings you
      # have activated already
      # dconf dump / > dconf.settings
      "org/gnome/shell" = {
        last-selected-power-profile = "power-saver";
      };
    };
  };
}
