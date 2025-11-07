#default desktop features to add
{pkgs, ...}: {
  imports = [
    # ./firefox.nix
    # ./dconf.nix
    # ./fonts.nix
    # ./easyeffects.nix
  ];

  home.packages = with pkgs; [
    prismlauncher
    path-of-building
  ];
}
