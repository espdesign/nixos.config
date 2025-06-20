{
  lib,
  pkgs,
  ...
}: {
  programs.ghostty.settings = {
    font-size = 12;
  };
  dconf = {
    enable = true;
    settings = {
      # To help find the location and setting of the database,
      # use the following command to see what settings you
      # have activated already
      # dconf dump / > dconf.settings
      # desktop specific home settings
      "org/gnome/shell" = {
        last-selected-power-profile = "performance";
      };
    };
  };
}
