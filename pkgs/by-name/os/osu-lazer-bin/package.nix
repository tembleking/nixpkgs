{
  lib,
  stdenvNoCC,
  fetchurl,
  fetchzip,
  appimageTools,
  makeWrapper,
  nativeWayland ? false,
}:

let
  pname = "osu-lazer-bin";
  version = "2025.424.0";

  src =
    {
      aarch64-darwin = fetchzip {
        url = "https://github.com/ppy/osu/releases/download/${version}/osu.app.Apple.Silicon.zip";
        hash = "sha256-fgG3SnltGxOYHwos8BTngaW4YrRdpOdURxd73sz0t7o=";
        stripRoot = false;
      };
      x86_64-darwin = fetchzip {
        url = "https://github.com/ppy/osu/releases/download/${version}/osu.app.Intel.zip";
        hash = "sha256-0K+uAH4f8JOfzG4J37aGaStpEkH5tdUfHEqsogMtN2I=";
        stripRoot = false;
      };
      x86_64-linux = fetchurl {
        url = "https://github.com/ppy/osu/releases/download/${version}/osu.AppImage";
        hash = "sha256-8nOoSkNbzEFpDj0FivCYI20tZzT02YHcKZblfEfh+Zo=";
      };
    }
    .${stdenvNoCC.system} or (throw "osu-lazer-bin: ${stdenvNoCC.system} is unsupported.");

  meta = {
    description = "Rhythm is just a *click* away (AppImage version for score submission and multiplayer, and binary distribution for Darwin systems)";
    homepage = "https://osu.ppy.sh";
    license = with lib.licenses; [
      mit
      cc-by-nc-40
      unfreeRedistributable # osu-framework contains libbass.so in repository
    ];
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    maintainers = with lib.maintainers; [
      gepbird
      stepbrobd
      Guanran928
    ];
    mainProgram = "osu!";
    platforms = [
      "aarch64-darwin"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };

  passthru.updateScript = ./update.sh;
in
if stdenvNoCC.hostPlatform.isDarwin then
  stdenvNoCC.mkDerivation {
    inherit
      pname
      version
      src
      meta
      passthru
      ;

    installPhase = ''
      runHook preInstall
      APP_DIR="$out/Applications"
      mkdir -p "$APP_DIR"
      cp -r . "$APP_DIR"
      runHook postInstall
    '';
  }
else
  appimageTools.wrapType2 {
    inherit
      pname
      version
      src
      meta
      passthru
      ;

    extraPkgs = pkgs: with pkgs; [ icu ];

    extraInstallCommands =
      let
        contents = appimageTools.extract { inherit pname version src; };
      in
      ''
        . ${makeWrapper}/nix-support/setup-hook
        mv -v $out/bin/${pname} $out/bin/osu!

        wrapProgram $out/bin/osu! \
          ${lib.optionalString nativeWayland "--set SDL_VIDEODRIVER wayland"} \
          --set OSU_EXTERNAL_UPDATE_PROVIDER 1

        install -m 444 -D ${contents}/osu!.desktop -t $out/share/applications
        for i in 16 32 48 64 96 128 256 512 1024; do
          install -D ${contents}/osu.png $out/share/icons/hicolor/''${i}x$i/apps/osu.png
        done
      '';
  }
