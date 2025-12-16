# pkgs/default.nix
{pkgs}: {
  # logical-name = pkgs.callPackage ./folder-name { };
  my-hello = pkgs.callPackage ./my-hello {};
}
