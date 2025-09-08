#default cli features to add
{pkgs, ...}: {
  imports = [
    ./fish.nix
    ./fzf.nix
    ./ghostty.nix
    ./syncthing.nix
    ./lua51.nix
    ];
  # programs.zoxide = {
  #   enable = true;
  #   enableFishIntegration = true;

  # };
  # programs.eza = {
  #   enable = true;
  #   enableFishIntegration = true;
  #   enableBashIntegration = true;
  #   extraOptions = ["-l" "--icons" "--git" "-a"];
  # };

  # programs.bat = {enable = true;};


  home.packages = with pkgs; [
    coreutils
    fd
    htop
    httpie
    jq
    procs
    ripgrep
    tldr
    zip
    wl-clipboard
    zip
    xz
    unzip
    ripgrep
    yq-go
    nmap
    file
    which
    glow
    btop
    yt-dlp
    gcc
    cargo
    
    #kickstart :checkhealth install deps
    luajitPackages.luarocks_bootstrap
    tree-sitter
    nodejs_24
    
    wget
    gnumake

    docker-compose

    nixd #nix language server
    alejandra #nix formatter
    nil
	
    #python tools
    pyright
    black
    python313Packages.pynvim
    python313Packages.debugpy
  ];
}
