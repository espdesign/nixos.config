{pkgs}: let
  pname = "awakened-poe-trade";
  version = "3.27.106";

  src = pkgs.fetchurl {
    url = "https://github.com/SnosMe/awakened-poe-trade/releases/download/v${version}/Awakened-PoE-Trade-${version}.AppImage";
    hash = "sha256-8L5Szn0KYfUMaTe+yyhJV1YZspmJCSlXSHXLPoiRhjE=";
  };

  appimage = pkgs.appimageTools.wrapType2 {
    inherit pname version src;
    extraPkgs = pkgs: [pkgs.xorg.libXScrnSaver pkgs.xorg.libXtst]; # Common electron/overlay deps
  };

  desktopItem = pkgs.makeDesktopItem {
    name = "awakened-poe-trade";
    exec = "${appimage}/bin/${pname}";
    icon = "awakened-poe-trade"; # You might need to manually fetch an icon if this doesn't resolve
    desktopName = "Awakened PoE Trade";
    categories = ["Utility" "Game"];
    comment = "Path of Exile trading app for price checking";
  };
in
  # Combine the appimage binary and the desktop item into one package
  pkgs.symlinkJoin {
    name = "${pname}-${version}";
    paths = [appimage desktopItem];
  }
