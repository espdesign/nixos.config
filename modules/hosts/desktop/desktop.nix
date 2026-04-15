### ./modules/host/$host/$host.nix

{
  inputs,
  self,
  lib,
  ...
}:
{
  flake = {
    # Declare desktop machine
    nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        desktop
        coreDefaults
      ];
    };

    # module for additional configuration
    nixosModules.desktop =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [

        ];
      };
  };
}
