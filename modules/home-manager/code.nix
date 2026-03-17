{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    # Use the standard vscode package or vscode-fhs for better compatibility with external binaries
    package = pkgs.vscode;

    # 1. Customizing Extensions
    # You can find these in the Nixpkgs registry
    extensions = with pkgs.vscode-extensions; [
      nonylene.dark-molokai-theme
      jnoortheen.nix-ide
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      # For your web dev work (Payload CMS / Next.js)
      bradlc.vscode-tailwindcss
    ];

    # 2. Customizing Editor Options (settings.json)
    userSettings = {
      # Typeface & Font Settings
      "editor.fontFamily" = "'JetBrains Mono', 'monospace', monospace";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 14;

      # Line Rulers (Good for maintaining code style/max line lengths)
      "editor.rulers" = [80 120];

      # General UI Customization
      "workbench.colorTheme" = "Dracula";
      "editor.formatOnSave" = true;
      "editor.minimap.enabled" = false;

      # Nix-specific IDE settings
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
    };
  };
}

