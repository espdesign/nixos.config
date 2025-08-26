{
  appimageTools,
  fetchurl,
}: let
  pname = "Exiled-Exchange-2";
  version = "0.10.3";

  src = fetchurl {
    url = "https://github.com/nukeop/nuclear/releases/download/v${version}/Exiled-Exchange-2-${version}.AppImage";
    hash = "sha256:93ff6373671336e948614c4ce976ef76aed26a6e0ea0410bfea82f2b68cbbea7";
  };
in
  appimageTools.wrapType2 {inherit pname version src;}
