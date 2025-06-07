{
  lib,
  pkgs,
  ...
}: {
  # ... https://nixos.wiki/wiki/Virt-manager
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["evan"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  #You may get the following error:
  ### authentication unavailable: no polkit agent available to authenticate action
  ###'org.libvirt.unix.manage'
  #To resolve, add the user to the libvirtd group:
  users.users.evan.extraGroups = ["libvirtd"];
}
