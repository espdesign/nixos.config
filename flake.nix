{
  description = "NixOS Config for Framework Laptop and Desktop";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hardware Configuration (Crucial for Framework)
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    ...
  } @ inputs: let
    inherit (self) outputs;

    # --- HELPER FUNCTION ---
    # This reduces boilerplate. It creates a system definition
    # merging the hostname, common modules, and hardware specs.
    mkSystem = {
      hostname,
      system ? "x86_64-linux",
      modules ? [],
    }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs outputs;};
        modules =
          [
            # Import the host-specific configuration
            ./hosts/${hostname}

            # Standard Home Manager Integration
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {inherit inputs outputs;};
              # Import the user configuration
              home-manager.users.espdesign = import ./home/espdesign.nix;
            }
          ]
          ++ modules; # Append extra modules passed to the function
      };
  in {
    # Custom Packages (Optional, formatted for all systems)
    # packages = nixpkgs.lib.genAttrs ["x86_64-linux"] (
    #   system:
    #     import ./pkgs nixpkgs.legacyPackages.${system}
    # );
    #
    # --- HOST CONFIGURATIONS ---
    nixosConfigurations = {
      # Desktop
      kitava-desktop = mkSystem {
        hostname = "kitava-desktop";
      };

      # Framework Laptop (12th Gen)
      sin-laptop = mkSystem {
        hostname = "sin-laptop";
        modules = [
          # Framework specific hardware optimizations
          nixos-hardware.nixosModules.framework-12th-gen-intel
        ];
      };
    };
  };
}
