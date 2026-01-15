{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "monokai-pro-ce"
      "supermaven"
    ];
    userSettings = {
      features = {
        inline_completion_provider = "supermaven";
      };
    };
  };
}
