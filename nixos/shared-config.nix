{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;
  environment.pathsToLink = ["/share/zsh"];
  environment.systemPackages = with pkgs; [
    code-cursor
    bottles
    qbittorrent
  ];
  virtualisation.docker.enable = true;
}
