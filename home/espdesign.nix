{pkgs, ...}: {
  home.username = "espdesign";
  home.homeDirectory = "/home/espdesign";

  programs.git = {
    enable = true;

    # This maps directly to your ~/.gitconfig structure
    extraConfig = {
      user = {
        name = "espdesign";
        email = "evanpendergraft@gmail.com";
      };

      # You can add other standard git settings here too
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  home.stateVersion = "24.05";
}
