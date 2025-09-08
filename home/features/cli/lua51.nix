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
    # The sha256 hash is required for reproducibility in pure evaluation mode.
    # This hash is for the *unpacked contents* of the tarball, not the Git commit hash.
    sha256 = "sha256:0m0xmk8sjb5gv2pq7s8w7qxf7qggqsd3rxzv3xrqkhfimy2x7bnx";
  }) {
    # We must explicitly pass the system attribute, as it is not available
    # in the pure evaluation context of fetchTarball.
    system = pkgs.system;
  };

  # Define a configuration setting for this feature.
  cfg = config.features.cli.lua51;

in {
  # Add a new option to enable the Lua 5.1 feature.
  options.features.cli.lua51 = {
    enable = mkEnableOption "enable Lua 5.1 from the specified nixpkgs version";
  };

  config = mkIf cfg.enable {
    # When enabled, add lua5.1 to the environment.systemPackages list,
    # making it available to all users on the system.
    home.packages = [
      luaPkgs.lua51Packages.lua
    ];
  };

}
