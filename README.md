# NixOS Configuration

A modular, flake-based NixOS configuration for my personal devices. This setup separates **mechanism** (modules) from **policy** (hosts), featuring a unified Home Manager integration.

**Devices:**

  * 🖥️ **kitava-desktop:** Main workstation (Nvidia, Gaming, GNOME)
  * 💻 **sin-laptop:** Framework 12th Gen (Intel, Mobile optimizations)

## 📂 Structure

The configuration follows a standard modular hierarchy:

```text
├── flake.nix             # Entry point & Inputs
├── hosts/                # Machine-specific configurations
│   ├── kitava-desktop/   # Imports specific modules + hardware scan
│   └── sin-laptop/       # Framework specific setup
├── modules/              # Reusable features
│   ├── core.nix          # Base system (Users, Locale, Nix settings)
│   ├── gnome.nix         # Desktop Environment logic
│   ├── nvidia.nix        # GPU Drivers
│   └── home-manager/     # User-space modules (Neovim, Zsh, Apps)
└── home/                 # User profiles (Home Manager entry points)
```

## 🚀 Installation

### Fresh Install

1.  Boot into the NixOS Installer ISO.
2.  Partition and mount your drives (`/mnt`, `/mnt/boot`, etc.).
3.  Clone this repository:
    ```bash
    git clone https://github.com/YOUR_USERNAME/nixos-config /mnt/etc/nixos
    ```
4.  Install the specific host:
    ```bash
    # For Desktop
    nixos-install --flake .#kitava-desktop

    # For Laptop
    nixos-install --flake .#sin-laptop
    ```

### Updates & Management

Once installed, use these commands to manage the system (Aliases provided in Zsh config):

  * **Apply Changes:**
    ```bash
    sudo nixos-rebuild switch --flake .
    ```
  * **Test Changes (VM):**
    ```bash
    nixos-rebuild build-vm --flake .#kitava-desktop
    ./result/bin/run-kitava-desktop-vm
    ```
  * **Update Flake Inputs:**
    ```bash
    nix flake update
    ```
  * **Clean Garbage:**
    ```bash
    sudo nix-collect-garbage -d
    ```

## 🛠️ Highlights

  * **Shell:** Zsh with autosuggestions and syntax highlighting.
  * **Terminal:** Ghostty (GPU accelerated).
  * **Editor:** Neovim (configured via dotfiles submodule).
  * **Gaming:** Dedicated module for Steam, Gamemode, and custom emulators.
  * **Secrets:** Hashed passwords via `mkpasswd`.

## ⚖️ License

This configuration is free to use and modify.

-----
