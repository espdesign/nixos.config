{config, ...}: {
  imports = [
    ./home.nix
    ../common

    ../features/cli # add cli features
  ];

  features = {
    cli = {
      fish.enable = true;
    };
  };
}
