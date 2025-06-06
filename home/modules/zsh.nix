{
  lib,
  pkgs,
  ...
}: {
  # install zsh
  zsh = {
    enable = true;
    sessionVariables = {EDITOR = "nvim";};
    enableCompletion = true;
    #    autosuggestions.enable = true;
    #    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      edit = "sudo -e";
      update = "sudo nixos-rebuild switch --flake .#framework";
    };
  };
}
