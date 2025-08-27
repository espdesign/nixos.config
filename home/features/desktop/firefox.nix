{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.firefox;
in {
  options.features.desktop.firefox.enable = mkEnableOption "enable extended firefox configuration";

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
    };
  };
}

