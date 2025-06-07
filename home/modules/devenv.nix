{
  lib,
  pkgs,
  ...
}: {
  # install distrobox, with debian
  environment.systemPackages = [
    pkgs.devenv
  ];
}
