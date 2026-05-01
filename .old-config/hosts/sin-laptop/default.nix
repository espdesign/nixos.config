{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    # Main Shared Configuration
    ../../modules/default.nix
  ];
  networking.hostName = "sin-laptop";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "24.05";
}
