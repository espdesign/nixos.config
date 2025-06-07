{
  lib,
  pkgs,
  ...
}: {
  # install distrobox, with debian
  programs.distrobox = {
    enable = true;
    containers = {
      pydev = {
        # pydev:  the name of the distrobox container
        image = "debian:latest";
        additional_packages = "python3 git uv";
        init_hooks = "";
      };
    };
  };
}
