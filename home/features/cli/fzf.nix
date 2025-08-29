{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.cli.fzf;
in {
  options.features.cli.fzf.enable = mkEnableOption "enable fuzzy finder";

  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };
  # colors = {
  #   "fg" = "#f8f8f8f2";
  # };
  # defaultOptions = [
  #   "--preview='bat --color=always -n{}'"
  #   "--bind 'ctrl-/:toggle-preview'"
  # ];
  # defaultCommand = "fd --type f --exclude .git --follow --hidden";


}

