#default desktop features to add
{pkgs, ...}: {
  imports = [
    ./firefox.nix
    ./dconf.nix
    ./fonts.nix
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
    obsidian
    discord
    ungoogled-chromium
    slack
    signal-desktop

    libreoffice
    mpv
    
  ];
  
}
