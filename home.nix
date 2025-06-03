{
  config,
  pkgs,
  ...
}: {
  # TODO please change the username & home directory to your own
  home.username = "evan";
  home.homeDirectory = "/home/evan";
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    discord
    #ghostty
    firefox

    zip
    xz
    unzip
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq

    # networking tools
    nmap # A utility for network discovery and security auditing
    file
    which
    glow # markdown previewer in terminal
    btop # replacement of htop/nmon
  ];
  programs = {
    # basic configuration of git
    git = {
      enable = true;
      userName = "Evan Pendergraft";
      userEmail = "evanpendergraft@gmail.com";
    };

    nvf = {
      enable = true;
      # your settings need to go into the settings attribute set
      # most settings are documented in the appendix
      # https://notashelf.github.io/nvf/options.html
      settings = {
        vim.vimAlias = true;
        vim = {
          theme = {
            enable = true;
            name = "gruvbox";
            style = "dark";
          };
          lsp.enable = true;
          lsp.formatOnSave = true;
          statusline.lualine.enable = true;
          telescope.enable = true;
          autocomplete.nvim-cmp.enable = true;
          clipboard.enable = true;
          navigation.harpoon.enable = true;

          languages = {
            enableTreesitter = true;
            nix = {
              enable = true;
              format.enable = true;
            };
            python.enable = true;
          };
        };
      };
    };

    # install zsh
    zsh = {
      enable = true;
      enableCompletion = true;
      #    autosuggestions.enable = true;
      #    syntaxHighlighting.enable = true;
      shellAliases = {
        ll = "ls -l";
        edit = "sudo -e";
        update = "sudo nixos-rebuild switch";
      };
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
      };
    };
    # Install firefox.
    firefox.enable = true;

    ghostty = {
      enable = true;
      settings = {
        theme = "dark:GruvboxDark,light:GruvboxLight";
        window-decoration = "none";
        font-size = 14;
      };
    };
  };
  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
