{
  lib,
  pkgs,
  ...
}: {
  # install zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    #    autosuggestions.enable = true;
    #    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      edit = "sudo -e";
      update = "sudo nixos-rebuild switch --flake"; # make sure to add hostname and dir .#framework"
    };
  };
}
