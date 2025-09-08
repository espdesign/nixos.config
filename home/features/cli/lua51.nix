{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  # Import the specified nixpkgs version from the user's provided URL.
  # We name it `luaPkgs` to avoid conflict with the system's `pkgs`.
  luaPkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/e6f23dc08d3624daab7094b701aa3954923c6bbb.tar.gz";
  }) {};

  # Define a configuration setting for this feature.
  cfg = config.features.languages.lua51;

in {
  # Add a new option to enable the Lua 5.1 feature.
  options.features.languages.lua51 = {
    enable = mkEnableOption "enable Lua 5.1 from the specified nixpkgs version";
  };

  config = mkIf cfg.enable {
    # When enabled, add lua5.1 to the environment.systemPackages list,
    # making it available to all users on the system.
    environment.systemPackages = [
      luaPkgs.lua51Packages.lua
    ];
  };

}
