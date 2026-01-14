{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/core.nix
    ../../modules/nvidia.nix # Enables nvidia drivers
    # ../../modules/gnome-suspend-fix.nix # Fixes suspend/resume issues with gnome
    ../../modules/gnome-desktop.nix # Enables gnome desktop
    ../../modules/pipewire-sound.nix # Enables pipewire sound
    ../../modules/printing.nix # Enables printing
    ../../modules/gaming.nix
    ../../modules/docker.nix
  ];
  networking.hostName = "kitava-desktop";

  # Bootloader specific to this machine (assuming systemd-boot)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "24.05";
}
