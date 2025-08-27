{config, ...}: {
  imports = [
    ./home.nix
    ../common
    ../features/cli # add cli features
    ../features/desktop # add desktop gui features
  ];

  features = {
    cli = {
      #these are located in /home/features/cli/*.nix
      fish.enable = true;
      fzf.enable = true;
      syncthing.enable = true;
      ghostty.enable = true;
    };
    desktop = {
      firefox.enable = true;
      dconf.enable = true;
      fonts.enable = true;
    };
  };
}
