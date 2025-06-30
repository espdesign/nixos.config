{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.pathsToLink = ["/share/zsh"];
  environment.systemPackages = with pkgs; [
    bottles
  ];
}
