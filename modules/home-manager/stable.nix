{
  pkgs,
  inputs,
  config,
  ...
}: let
  # Instantiate the stable package set (using the input you added to flake.nix)
  pkgsStable = import inputs.nixpkgs-stable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in {
  # You can add any stable packages to this list
  home.packages = with pkgsStable; [
    vesktop
    rustdesk-flutter
    # obsidian  # Example: if you wanted a stable version of obsidian too
  ];
}
