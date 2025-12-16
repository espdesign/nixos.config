{
  pkgs,
  lib,
  osConfig,
  inputs,
  ...
}: {
  # Only apply this configuration if the hostname matches your desktop
  config = lib.mkIf (osConfig.networking.hostName == "kitava-desktop") {
    home.packages = with pkgs; [
      # Minecraft
      prismlauncher

      # Path of Exile
      rusty-path-of-building
      #path of building in /pkgs/path-of-building
      inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.awakened-poe-trade
      # Emulators
      (retroarch.withCores (cores:
        with cores; [
          parallel-n64
        ]))
    ];
  };
}
