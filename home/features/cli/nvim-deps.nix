{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.cli.nvim-deps;
  luaPkgs =
    import (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/e6f23dc08d3624daab7094b701aa3954923c6bbb.tar.gz";
      # The sha256 hash is required for reproducibility in pure evaluation mode.
      # This hash is for the *unpacked contents* of the tarball, not the Git commit hash.
      sha256 = "sha256:0m0xmk8sjb5gv2pq7s8w7qxf7qggqsd3rxzv3xrqkhfimy2x7bnx";
    }) {
      # We must explicitly pass the system attribute, as it is not available
      # in the pure evaluation context of fetchTarball.
      system = pkgs.system;
    };
in {
  options.features.cli.nvim-deps.enable = mkEnableOption "enable deps for neovim dotfile config";

  config = mkIf cfg.enable {
    home.packages = [
      #kickstart :checkhealth install deps
      luajitPackages.luarocks_bootstrap
      tree-sitter
      nodejs_24
      nixd #nix language server
      alejandra #nix formatter
      nil
      luaPkgs.lua51Packages.lua
      luaPkgs.lua51Packages.jsregexp
    ];
  };
}
