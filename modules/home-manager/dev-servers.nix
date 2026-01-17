{pkgs, ...}: {
  home.packages = with pkgs; [
    package-version-server
    dockerfile-language-server
  ];
}
