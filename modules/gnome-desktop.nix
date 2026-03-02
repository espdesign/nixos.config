{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Exclude default GNOME bloat (Optional)
  # If you don't want Tour, Music, Epiphany, etc.

  # 1. Create the custom "Clean" Thunderbird launcher
  xdg.desktopEntries.thunderbird-clean = {
    name = "Thunderbird (Clean Env)";
    genericName = "Email Client";
    exec = "env LD_LIBRARY_PATH= ${pkgs.thunderbird}/bin/thunderbird %u";
    terminal = false;
    categories = ["Application" "Network" "Email"];
    mimeType = ["x-scheme-handler/mailto"];
    icon = "thunderbird"; # Ensures the icon still shows up
  };

  # Add GNOME specific system packages (like Tweaks)
  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
  ];
}
