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
    initialHashedPassword = "$6$gMclef8wWibtLst0$6f0JIElUbX3DvW78zAOhLOesfigbHrMN0hzRgTDZaFjbG8uP6Nkzjm4an1AM0VriCyrLG8ECrHIJn.6OHbgdP0";
  };
  #enable zsh system-wide
  programs.zsh.enable = true;

  # NOTE IT MAY BE BETTER TO ADD IN ./home-manager/app.nix if you dont want system level
  # Universal packages, or tools you always want accessible
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
  ];

  fonts.packages = with pkgs; [
    fira-code
    font-manager
    font-awesome_5
    noto-fonts
    jetbrains-mono
  ];
}
