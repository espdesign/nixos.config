{
  config,
  pkgs,
  ...
}: {
  #import modules
  imports = [
    ./modules/starship.nix
    ./modules/zsh.nix
    #./modules/distrobox.nix
    ./modules/virt-manager.nix
  ];

  # TODO please change the username & home directory to your own
  home.username = "evan";
  home.homeDirectory = "/home/evan";
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    #gnome specific
    dconf
    dconf-editor
    gnome-shell-extensions
    gnomeExtensions.appindicator

    #used non-free apps
    spotify
    obsidian
    discord
    ungoogled-chromium
    slack
    signal-desktop
    #office apps
    libreoffice
    #nix helpers
    # devenv
    # utilities
    wl-clipboard
    mpv

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
  # services.podman.enable = true;
  services.syncthing = {
    enable = true;
    overrideDevices = false;
    overrideFolders = false;
    settings = {
      devices = {
        "homelab" = {id = "2B5LXHB-NE2FZ3F-M34RP6Y-G3NS2PD-JGN6CUH-KV3FWVI-ZAXEEJ5-QIZ77A3";};
      };
      folders = {
        "syncdocs" = {
          id = "gfrgi-utm7w";
          path = "/home/evan/Documents/syncdocs";
          devices = ["homelab"];
        };
      };
    };
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.file.".local/share/backgrounds/molly-wallpaper.jpg".source = ./wallpaper.jpg;
  dconf = {
    enable = true;
    settings = {
      # To help find the location and setting of the database,
      # use the following command to see what settings you
      # have activated already

      # dconf dump / > dconf.settings
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = ["appindicatorsupport@rgcjonas.gmail.com"];
        favorite-apps = ["org.gnome.Nautilus.desktop" "firefox.desktop" "com.mitchellh.ghostty.desktop"];
      };

      "org/gnome/desktop/interface" = {
        show-battery-percentage = true;
        clock-format = "12h";
      };
      # set desktop background for dark and light mode.
      "org/gnome/desktop/background" = {
        picture-uri = "file://${config.home.homeDirectory}/.local/share/backgrounds/molly-wallpaper.jpg";
        picture-uri-dark = "file://${config.home.homeDirectory}/.local/share/backgrounds/molly-wallpaper.jpg";
      };
    };
  };
  programs = {
    # Enable github.com cli.
    gh.enable = true;
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
          options = {
            shiftwidth = 4;
            tabstop = 4;
            expandtab = true;
          };
          autocmds = [
            {
              event = ["BufEnter"];
              pattern = ["*.nix"];
              desc = "command to run entering nix buffer";
              command = "setlocal tabstop=2 shiftwidth=2 expandtab";
              once = true;
            }
            {
              event = ["BufEnter"];
              pattern = ["*.py"];
              desc = "command to run entering py buffer";
              command = "setlocal tabstop=4 shiftwidth=4 expandtab";
              once = true;
            }
          ];
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
            python.format.enable = true;
          };
        };
      };
    };
    # Install firefox.
    firefox.enable = true;
    ghostty = {
      enable = true;
      settings = {
        theme = "dark:GruvboxDark,light:GruvboxLight";
        window-decoration = "auto";
        background-opacity = 0.95;
        background-blur = true;
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
