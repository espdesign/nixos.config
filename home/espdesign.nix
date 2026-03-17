{ pkgs, ... }:
{
  imports = [
    ../modules/home-manager/default.nix
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
    google-chrome
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
