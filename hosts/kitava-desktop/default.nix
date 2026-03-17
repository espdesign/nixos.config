{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    # Main Shared Configuration
    ../../modules/default.nix # Main configuration file

    # Unique to this host
    ../../modules/nvidia.nix # Enables nvidia drivers
    ../../modules/gaming.nix # Gaming related settings
  ];
  networking.hostName = "kitava-desktop";

  # Bootloader specific to this machine (assuming systemd-boot)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "24.05";
}
