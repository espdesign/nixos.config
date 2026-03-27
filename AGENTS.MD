# Agent Instructions

This file contains instructions for agents on how to perform common tasks in this repository.

## Adding a new host

To add a new host to the NixOS configuration, follow these steps:

1.  Create a new directory under `hosts/` with the name of the new host.
2.  Inside the new directory, create two files: `default.nix` and `hardware.nix`.
3.  The `default.nix` file should contain the main configuration for the new host, including the import of the `hardware.nix` file. You can use the existing hosts as a template.
4.  The `hardware.nix` file should contain the hardware-specific configuration for the new host. You can generate this file by running `nixos-generate-config` on the new host and copying the `hardware-configuration.nix` file.
5.  Add the new host to the `flake.nix` file, under the `nixosConfigurations` section.

## Using the `my-hello` package

This repository contains a custom package called `my-hello`. To use it, add `pkgs.my-hello` to the `environment.systemPackages` list in your `default.nix` file.

This will make the `my-hello` command available in your shell. Running `my-hello` will print a message to the console.
