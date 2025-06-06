{
  description = "NixOS configuration with flakes";
  inputs = {
    #Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #Nixos Hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; # Consider pinning this too

    #Neovim nix
    nvf.url = "github:notashelf/nvf";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    nvf,
  }: {
    nixosConfigurations = {
      # replace <your-hostname> with your actual hostname
      framework = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/configuration.nix
          #reduce disk usage modules`
          ./modules/reduce-disk-use.nix
          nixos-hardware.nixosModules.framework-12th-gen-intel
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # home-manager.users.evan = {pkgs, ...}: {
            home-manager.users.evan = {
              imports = [
                ./home/home.nix
                nvf.homeManagerModules.default
              ];
            };
          }
        ];
      };
    };
  };
}
