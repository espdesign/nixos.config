{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;
  environment.pathsToLink = ["/share/zsh"];
  environment.systemPackages = with pkgs; [
    bottles
  ];
}
