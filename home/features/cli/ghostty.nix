{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.cli.ghostty;
in {
  options.features.cli.ghostty.enable = mkEnableOption "enable ghostty terminal";

  config = mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      settings = {
        theme = "dark:GruvboxDark,light:GruvboxLight";
        window-decoration = "auto";
        background-opacity = 0.95;
        background-blur = true;
      };
    };
  };
}

