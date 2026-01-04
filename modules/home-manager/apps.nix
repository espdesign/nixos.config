{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # Editors / Dev

    devenv
    # Remote Desktop
    #rustdesk-flutter set to stable.nix module

    # Productivity
    obsidian
    libreoffice
    typst

    # Communication
    #vesktop set to stable.nix module
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
    # Note: You already installed 'appindicator' in your system config?

    # Browsers (Ungooled Chromium)
    # Firefox is handled in its own module
    ungoogled-chromium

    # --- YOUR CUSTOM PACKAGES ---
    # This grabs 'my-hello' from your ./pkgs/default.nix
    inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.my-hello
  ];

  # EasyEffects Service (If you just want it installed)
  services.easyeffects.enable = true;
}
