{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.easyeffects;
in {
  options.features.desktop.easyeffects.enable = mkEnableOption "enable easy effects on the computer";

  config = mkIf cfg.enable {
    services.easyeffects = {
      enable = true;
    };
  };
}

