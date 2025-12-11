{
  pkgs,
  lib,
  osConfig,
  ...
}: {
  # Only apply this configuration if the hostname matches your desktop
  config = lib.mkIf (osConfig.networking.hostName == "kitava-desktop") {
    home.packages = with pkgs; [
      # Minecraft
      prismlauncher

      # Path of Exile
      rusty-path-of-building

      # Emulators
      (retroarch.withCores (cores:
        with cores; [
          parallel-n64
        ]))
    ];
  };
}
