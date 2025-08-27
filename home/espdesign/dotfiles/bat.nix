#example showing how to add simple dotfiles
{
  home.file.".config/bat/config".text = ''
    --theme="Dracula"

    # Show line numbers, Git modifications and file header (but no grid)
    --style="numbers,changes,header"
  '';
}
