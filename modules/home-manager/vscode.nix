{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      vscodevim.vim
    ];
  };
  programs.zed-editor = {
    enable = true;
    extensions = ["monokai-pro-ce"];
  };
}
