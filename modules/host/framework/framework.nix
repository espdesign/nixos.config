{ inputs, self, ... }:
{
  flake.nixosConfigurations.framework = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      framework
    ];
  };

  flake.nixosModules.framework =
    { pkgs, ... }:
    {
      imports = with self.nixosModules; [
        coreDefaults
      ];

    };
}
