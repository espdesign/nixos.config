{
  description = "NixOS configuration with flakes";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; # Consider pinning this too
    nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
      framework-nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.framework-12th-gen-intel
          nvf.nixosModules.default

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.evan = {pkgs, ...}: {
              imports = [./home.nix];
            };
          }
        ];
      };
    };
  };
}
