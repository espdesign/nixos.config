{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Exclude default GNOME bloat (Optional)
  # If you don't want Tour, Music, Epiphany, etc.
  services.gnome.excludePackages = with pkgs; [
    gnomeExtensions.tour
    gnomeExtensions.music
    gnomeExtensions.epiphany
  ];

  # Add GNOME specific system packages (like Tweaks)
  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
  ];
}
