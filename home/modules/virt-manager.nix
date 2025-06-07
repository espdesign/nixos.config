{
  lib,
  pkgs,
  ...
}: {
  # https://nixos.wiki/wiki/Virt-manager
  # You will get a warning when you open it for the first time:

  # Could not detect a default hypervisor. Make sure the appropriate
  # QEMU/KVM virtualization packages are installed to manage virtualization on this host.

  # A virtualization connection can be manually added via File->Add Connection
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
