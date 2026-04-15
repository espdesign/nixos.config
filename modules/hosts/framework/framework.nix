### ./modules/host/$host/$host.nix

{
  inputs,
  self,
  lib,
  ...
}:
{
  flake = {
    # Declare $host machine
    nixosConfigurations.framework = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        framework
        #hyprland
        otherExampleMoudule
        fish
      ];
    };

    # module for additional configuration
    nixosModules.framework =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [

        ];
      };
  };
}
