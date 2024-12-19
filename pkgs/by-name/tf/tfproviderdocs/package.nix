{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
let
  version = "0.12.1";
  tag = "v${version}";
in
buildGoModule {
  pname = "tfproviderdocs";
  inherit version;

  src = fetchFromGitHub {
    owner = "bflad";
    repo = "tfproviderdocs";
    rev = tag;
    hash = "sha256-KCkohIGkh6sg/e0qBi90hMqh/XQQNCBF6Di6V2gxqak=";
  };

  vendorHash = "sha256-fSb1C2W29zF6ygiIg6iq19A4B6ensZLqyPD5MhQ5ec8=";

  ldflags = [
    "-s"
    "-w"
    "-X github.com/bflad/tfproviderdocs/version.Version=${version}"
    "-X github.com/bflad/tfproviderdocs/version.VersionPrerelease="
  ];

  doInstallCheck = true;
  installCheckPhase = ''
    $out/bin/tfproviderdocs version | grep ${tag} > /dev/null
  '';

  meta = with lib; {
    description = "Terraform Provider Documentation Tool";
    license = licenses.mpl20;
    longDescription = ''
      tfproviderdocs is an open-source tool for validating the documentation of Terraform providers.
      It automates the checking of documentation based on the provider's code specifications and configurations.
      This helps developers maintain consistent and up-to-date documentation.
    '';
    homepage = "https://github.com/bflad/tfproviderdocs";
    maintainers = with maintainers; [ tembleking ];
    mainProgram = "tfproviderdocs";
  };
}
