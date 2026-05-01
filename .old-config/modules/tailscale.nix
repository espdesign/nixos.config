{
  # Enable systemd-resolved for MagicDNS support
  services.resolved.enable = true;

  # Allow Tailscale to interface with resolved
  services.tailscale.enable = true;

  # Standard NixOS firewall tweaks for Tailscale
  networking.firewall.checkReversePath = "loose";
  networking.firewall.trustedInterfaces = [ "tailscale0" ];
}
