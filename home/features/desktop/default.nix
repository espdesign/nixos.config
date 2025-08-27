#default desktop features to add
{pkgs, ...}: {
  imports = [
    ./firefox.nix
    ];

  home.packages = with pkgs; [
    vscode
    bottles
    qbittorrent

    dconf
    dconf-editor
    gnome-shell-extensions
    gnomeExtensions.appindicator

    spotify
    obisidan
    discord
    ungoogled-chromium
    slack
    signal-desktop

    libreoffice
    mpv
    
  ];
  
}
