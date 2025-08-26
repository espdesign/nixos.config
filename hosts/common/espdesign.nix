  # # --- Define a user account.---
  # # Don't forget to set a password with ‘passwd’.
  # users.users.espdesign = {
  #   isNormalUser = true;
  #   description = "Evan Pendergraft";
  #   extraGroups = ["networkmanager" "wheel" "docker"];
  #   packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
  #   # shell = pkgs.zsh;
  # };

  {
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.espdesign = {
    initialHashedPassword = "$y$j9T$f9pUBtENigfkiwJWwsYui0$9fgDxOotM3MBjAZkVlGi8cXVeJYf5cgVeEWe2tNrg9D";
    isNormalUser = true;
    description = "Evan Pendergraft";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
    ];
    # openssh.authorizedKeys.keys = [
    #   "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3YEmpYbM+cpmyD10tzNRHEn526Z3LJOzYpWEKdJg8DaYyPbDn9iyVX30Nja2SrW4Wadws0Y8DW+Urs25/wVB6mKl7jgPJVkMi5hfobu3XAz8gwSdjDzRSWJrhjynuaXiTtRYED2INbvjLuxx3X8coNwMw58OuUuw5kNJp5aS2qFmHEYQErQsGT4MNqESe3jvTP27Z5pSneBj45LmGK+RcaSnJe7hG+KRtjuhjI7RdzMeDCX73SfUsal+rHeuEw/mmjYmiIItXhFTDn8ZvVwpBKv7xsJG90DkaX2vaTk0wgJdMnpVIuIRBa4EkmMWOQ3bMLGkLQeK/4FUkNcvQ/4+zcZsg4cY9Q7Fj55DD41hAUdF6SYODtn5qMPsTCnJz44glHt/oseKXMSd556NIw2HOvihbJW7Rwl4OEjGaO/dF4nUw4c9tHWmMn9dLslAVpUuZOb7ykgP0jk79ldT3Dv+2Hj0CdAWT2cJAdFX58KQ9jUPT3tBnObSF1lGMI7t77VU= m3tam3re@m3-nix"
    # ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.m3tam3re =
    import ../../../home/espdesign/${config.networking.hostName}.nix;
}
