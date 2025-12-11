{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    # Make it feel like Fish (optional but recommended)
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Porting your Aliases
    shellAliases = {
      vim = "nvim";
      # ".." = "cd ..";
    };

    # Porting your Environment Variables
    # initExtra runs at the end of .zshrc
    initExtra = ''
      export NIX_PATH=nixpkgs=channel:nixos-unstable
      export NIX_LOG=info
      export TERMINAL=ghostty
      export EDITOR=nvim

      # Fix for pure Nix setups (sometimes needed for path)
      if [ -e /home/espdesign/.nix-profile/etc/profile.d/nix.sh ]; then . /home/espdesign/.nix-profile/etc/profile.d/nix.sh; fi
    '';

    # Optional: Oh My Zsh (if you use it for themes)
    # oh-my-zsh = {
    #   enable = true;
    #   plugins = [ "git" "sudo" ];
    #   theme = "robbyrussell";
    # };
  };
}
