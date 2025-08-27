{inputs,...}:{
    imports = [
    ./bat.nix #currently commented out but an example on how to add simple dotfiles
    ];
    home.file.".config/nvim" = {
    source = "${inputs.dotfiles}/nvim";
    recursive = true;
  };
}