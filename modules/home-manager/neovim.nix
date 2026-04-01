{
  pkgs,
  inputs,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # --- The "Deps" Section ---
  # These are available in your shell AND inside Neovim
  home.packages = with pkgs; [
    # 1. Lua Dependencies (for checkhealth / rocks)
    luajitPackages.luarocks_bootstrap
    lua51Packages.lua
    lua51Packages.jsregexp
    lua-language-server
    # 2. Nix Tools
    nixd # Nix LSP (Excellent choice)
    alejandra # Nix Formatter
    nil # Alternative Nix LSP (Optional: having both can be redundant)

    # 3. Web / General Tools
    tree-sitter # Standard for syntax highlighting
    nodejs_24 # Specific node version (if not using the built-in one)
    markdownlint-cli
  ];
  # home.file.".local/share/backgrounds/wallpaper-molly.jpg".source =
  # ../../assets/wallpapers/wallpaper-molly.jpg;
  xdg.configFile."nvim".source = "${inputs.dotfiles}/nvim";
}
