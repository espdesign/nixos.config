{pkgs, ...}: {
  home.username = "espdesign";
  home.homeDirectory = "/home/espdesign";

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "espdesign";
        email = "evanpendergraft@gmail.com";
      };

      init = {
        defaultBranch = "main";
      };

      pull = {
        rebase = true;
      };
    };
  };

  home.stateVersion = "24.05";
}
