#default desktop features to add
{pkgs, ...}: {
  imports = [
    ./firefox.nix
    ./dconf.nix
    ./fonts.nix
    ./easyeffects.nix
  ];

  home.packages = with pkgs; [
    zed-editor

    bottles
    qbittorrent

    dconf
    dconf-editor
    gnome-shell-extensions
    gnomeExtensions.appindicator

    spotify
    obsidian
    discord
    ungoogled-chromium
    slack
    signal-desktop

    libreoffice
    mpv

    podman-desktop
  ];
}
