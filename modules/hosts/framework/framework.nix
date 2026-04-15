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
        coreDefaults
      ];
    };

    # module for additional configuration
    flake.nixosModules.framework =
      { pkgs, ... }:
      {
        imports = with self.nixosModules; [
        ];
      };
  };
}
