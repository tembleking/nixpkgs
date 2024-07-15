{ lib
, stdenv
, fetchzip
, firefox-bin
, suffix
, revision
, system
, throwSystem
}:
let
  suffix' = if lib.hasPrefix "linux" suffix
            then "ubuntu-22.04" + (lib.removePrefix "linux" suffix)
            else suffix;
in
stdenv.mkDerivation {
  name = "firefox";
  src = fetchzip {
    url = "https://playwright.azureedge.net/builds/firefox/${revision}/firefox-${suffix'}.zip";
    sha256 = {
      x86_64-linux = "15pbx645vsklqkv3g0h1z1xy8xylr87r6kqmzk6idg8wpg6s738n";
      aarch64-linux = "198wl4rcqisgfyybdgnyvf20v28q91rjjfbwz377bx4c0awxfgnk";
    }.${system} or throwSystem;
  };

  inherit (firefox-bin.unwrapped)
    nativeBuildInputs
    buildInputs
    runtimeDependencies
    appendRunpaths
    patchelfFlags
  ;

  buildPhase = ''
    mkdir -p $out/firefox
    cp -R . $out/firefox
  '';
}
