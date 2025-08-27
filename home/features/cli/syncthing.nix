{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.cli.syncthing;
in {
  options.features.cli.syncthing.enable = mkEnableOption "enable syncthing homelab shared folder";

  config = mkIf cfg.enable {
  services.syncthing = {
      enable = true;
      overrideDevices = false;
      overrideFolders = false;
      settings = {
        devices = {
          "homelab" = {id = "2B5LXHB-NE2FZ3F-M34RP6Y-G3NS2PD-JGN6CUH-KV3FWVI-ZAXEEJ5-QIZ77A3";};
        };
        folders = {
          "syncdocs" = {
            id = "gfrgi-utm7w";
            path = "/home/evan/Documents/syncdocs";
            devices = ["homelab"];
          };
        };
      };
    };
};
}
