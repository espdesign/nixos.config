{pkgs, ...}: let
  pname = "awakened-poe-trade";
  version = "3.27.106";

  src = pkgs.fetchurl {
    url = "https://github.com/SnosMe/awakened-poe-trade/releases/download/v${version}/Awakened-PoE-Trade-${version}.AppImage";
    # Hash for version 3.27.106 (Linux AppImage)
    hash = "sha256-f0be52ce7d0a61f50c6937becb2849575619b299890929574875cb3e88918631";
  };
in
  pkgs.appimageTools.wrapType2 {
    inherit pname version src;

    # If it fails to launch, you might need to add libraries here
    extraPkgs = pkgs:
      with pkgs; [
        # Common Electron dependencies often needed
        libsecret
        libnotify
        udev
      ];

    # Fix for Wayland users: The overlay often requires X11 to work correctly
    # We force it to use the XWayland backend
    extraInstallCommands = ''
      mv $out/bin/${pname} $out/bin/${pname}.orig
      makeWrapper $out/bin/${pname}.orig $out/bin/${pname} \
        --set GDK_BACKEND x11

      # Install the Desktop Entry
      install -m 444 -D ${src} $out/bin/${pname}.AppImage
      # (Optional: Extract icon and desktop file if you want them to appear in GNOME search)
    '';
  }
