{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.gnomesettings;
in {
  options.features.desktop.gnomesettings.enable = mkEnableOption "enable extended gnome configuration";

  config = mkIf cfg.enable {
    home.file.".local/share/backgrounds/wallpaper-molly.jpg".source = ./wallpaper-molly.jpg;
    dconf = {
      enable = true;
      settings = {
        # To help find the location and setting of the database,
        # use the following command to see what settings you
        # have activated already

        # dconf dump / > dconf.settings
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = ["appindicatorsupport@rgcjonas.gmail.com"];
          favorite-apps = ["org.gnome.Nautilus.desktop" "firefox.desktop" "com.mitchellh.ghostty.desktop"];
        };

        "org/gnome/desktop/interface" = {
          show-battery-percentage = true;
          clock-format = "12h";
        };
        # set desktop background for dark and light mode.
        "org/gnome/desktop/background" = {
          picture-uri = "file://${config.home.homeDirectory}/.local/share/backgrounds/wallpaper-molly.jpg";
          picture-uri-dark = "file://${config.home.homeDirectory}/.local/share/backgrounds/wallpaper-molly.jpg";
        };
    };
  };
  };
}

