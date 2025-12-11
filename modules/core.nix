{
  pkgs,
  inputs,
  ...
}: {
  # Nix Settings
  nix.settings.experimental-features = ["nix-command" "flakes"]; # enable flakes

  # nix garbage collection, https://nixos.wiki/wiki/Storage_optimization#Automation
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  # Allow unfree packages (Chrome, VSCode, etc)
  nixpkgs.config.allowUnfree = true;
  # Locale & Time
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # User Configuration, Needed for Home Manager to attach
  users.users.espdesign = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.zsh;
    initialHashedPassword = "$6$N2xGDWXhZ.WnQ2Sr$BKf7SyNZ5fMdUkt7RCGZYYPSiMYJBucgfVVqq.YiFP3RdMx3ACw891k/0h4jA//AhYPNq76tydDLaTce1bikE.";
  };
  #enable zsh system-wide
  programs.zsh.enable = true;
  # Universal packages, or tools you always want accessible
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
  ];
}
