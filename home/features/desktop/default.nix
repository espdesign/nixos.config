#default cli features to add
{pkgs, ...}: {
  imports = [
    ./firefox.nix
    ];

  home.packages = with pkgs; [

  ];
}
