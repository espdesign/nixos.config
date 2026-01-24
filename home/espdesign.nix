{ pkgs, ... }:
{
  imports = [
    ../modules/home-manager/syncthing.nix
    ../modules/home-manager/zsh.nix
    ../modules/home-manager/ghostty.nix
    ../modules/home-manager/neovim.nix
    ../modules/home-manager/mozilla.nix
    ../modules/home-manager/apps.nix
    ../modules/home-manager/gaming-user.nix
    ../modules/home-manager/gnome-user.nix
    ../modules/home-manager/zed-editor.nix
    ../modules/home-manager/dev-servers.nix
  ];
  home.username = "espdesign";
  home.homeDirectory = "/home/espdesign";

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "espdesign";
        email = "evanpendergraft@gmail.com";
      };

      init = {
        defaultBranch = "main";
      };

      pull = {
        rebase = true;
      };
    };
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
  home.packages = with pkgs; [
    # Core Utils
    coreutils
    fd
    htop
    httpie
    jq
    ripgrep
    tldr
    zip
    unzip
    xz
    wl-clipboard
    file
    which
    glow
    procs
    yq-go

    # Network / Security
    nmap
    wget

    # Dev / Build Tools
    gcc
    gnumake
    cargo
    cachix

    # Python Environment
    (python3.withPackages (
      ps: with ps; [
        pyright
        black
        pynvim
        debugpy
      ]
    ))

    # Media
    yt-dlp

    google-chrome
  ];
  home.stateVersion = "24.05";
}
