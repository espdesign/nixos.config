{config, ...}: {
  imports = [
    ./home.nix
    ../common
    ../features/cli # add cli features
  ];

  features = {
    cli = {
      #these are located in /home/features/cli/*.nix
      fish.enable = true;
      fzf.enable = true;
    };
  };
}
