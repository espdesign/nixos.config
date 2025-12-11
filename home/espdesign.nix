{pkgs, ...}: {
  home.username = "espdesign";
  home.homeDirectory = "/home/espdesign";

  # Simple test program
  programs.git = {
    enable = true;
    userName = "Your Name";
    userEmail = "you@example.com";
  };

  home.stateVersion = "24.05";
}
