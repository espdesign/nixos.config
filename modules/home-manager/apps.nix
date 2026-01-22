{
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    # Editors / Dev

    devenv
    # Remote Desktop
    rustdesk-flutter

    # Productivity
    obsidian
    libreoffice
    typst
    stirling-pdf
    thunderbird

    # Communication
    vesktop
    slack
    signal-desktop

    # Media
    spotify
    mpv
    bottles
    qbittorrent

    # GNOME Utilities
    dconf-editor
    gnome-shell-extensions

    # --- YOUR CUSTOM PACKAGES ---
    # This grabs 'my-hello' from your ./pkgs/default.nix
    inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.my-hello
  ];

  # EasyEffects Service (If you just want it installed)
  services.easyeffects.enable = true;
}
