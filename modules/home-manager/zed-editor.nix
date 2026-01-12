{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [ "monokai-pro-ce" ];
  };
}
