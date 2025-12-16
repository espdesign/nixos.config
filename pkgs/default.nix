# pkgs/default.nix
{pkgs}: {
  # logical-name = pkgs.callPackage ./folder-name { };
  my-hello = pkgs.callPackage ./my-hello {};
  awakened-poe-trade = pkgs.callPackage ./awakened-poe-trade {};
}
