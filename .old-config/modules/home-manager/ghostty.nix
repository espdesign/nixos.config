{pkgs, ...}: {
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "dark:Gruvbox Dark,light:Gruvbox Light";
      window-decoration = "auto";
      background-opacity = 0.95;
      background-blur = true;

      # Optional: Explicitly set the font if you want
      # font-family = "JetBrainsMono Nerd Font";
    };
  };
}
