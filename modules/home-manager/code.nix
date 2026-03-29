{ pkgs, hostname, ... }:
{
  programs.vscode = {
    enable = true;
    # Use the standard vscode package or vscode-fhs for better compatibility with external binaries
    package = pkgs.vscode;

    profiles.default.extensions =
      with pkgs.vscode-extensions;
      [
        nonylene.dark-molokai-theme
        jnoortheen.nix-ide
        dbaeumer.vscode-eslint
        esbenp.prettier-vscode

        bradlc.vscode-tailwindcss
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        # Adding extensions NOT in nixpkgs:
        # 1. Find the extension on VS Code Marketplace (e.g., https://marketplace.visualstudio.com/items?itemName=PublisherName.extension-name)
        # 2. Note the publisher name and extension name from the URL
        # 3. Get the latest version number from the page
        # 4. Run: nix store prefetch-file https://marketplace.visualstudio.com/_apis/public/gallery/publishers/<Publisher>/vsextensions/<extension>/<version>/vspackage
        # 5. Add to extensionsFromVscodeMarketplace below with the sha256 hash
        #
        # Example:
        # ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        #   {
        #     name = "extension-name";
        #     publisher = "Publisher";
        #     version = "1.0.0";
        #     sha256 = "hash-from-step-4";
        #   }
        # ]
        #
        {
          name = "beardedtheme";
          publisher = "BeardedBear";
          version = "10.1.0";
          sha256 = "7MkvLEadzgB7af01lYibEOqHn9bvzlpgMTEiiQBlEzA=";
        }
      ];

    # 2. Customizing Editor Options (settings.json)
    profiles.default.userSettings = {
      # Typeface & Font Settings
      "editor.fontFamily" = "'JetBrains Mono', 'monospace', monospace";
      "editor.fontLigatures" = true;
      "editor.fontSize" = if hostname == "sin-laptop" then 16 else 14;

      # Line Rulers (Good for maintaining code style/max line lengths)
      "editor.rulers" = [
        80
        120
      ];

      # General UI Customization
      "workbench.colorTheme" = "Bearded Theme";
      "editor.formatOnSave" = true;
      "editor.minimap.enabled" = false;

      # Nix-specific IDE settings
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
    };
  };
}
