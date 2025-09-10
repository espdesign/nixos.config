{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.cli.nvim-deps;
in {
  options.features.cli.nvim-deps.enable = mkEnableOption "enable deps for neovim dotfile config";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      #kickstart :checkhealth install deps
      luajitPackages.luarocks_bootstrap
      tree-sitter
      nodejs_24
      nixd #nix language server
      alejandra #nix formatter
      nil
      lua51Packages.lua
      lua51Packages.jsregexp
      # luaPkgs.lua51Packages.lua
      # luaPkgs.lua51Packages.jsregexp
      nodePackages.coc-markdownlint
    ];
  };
}
