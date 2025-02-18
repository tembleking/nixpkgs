{
  lib,
  stdenv,
  fetchurl,
  nixosTests,
}:

stdenv.mkDerivation (finalAttrs: {
  version = "0.9.2";
  pname = "tayga";

  src = fetchurl {
    url = "http://www.litech.org/tayga/tayga-${finalAttrs.version}.tar.bz2";
    hash = "sha256-Kx95J6nS3P+Qla/zwnGSSwUsz9L6ypWIsndDGkTwAJw=";
  };

  env.NIX_CFLAGS_COMPILE = toString [
    "-Wno-address-of-packed-member"
    "-Wno-implicit-function-declaration"
  ];

  passthru.tests.tayga = nixosTests.tayga;

  meta = with lib; {
    description = "Userland stateless NAT64 daemon";
    longDescription = ''
      TAYGA is an out-of-kernel stateless NAT64 implementation
      for Linux that uses the TUN driver to exchange IPv4 and
      IPv6 packets with the kernel.
      It is intended to provide production-quality NAT64 service
      for networks where dedicated NAT64 hardware would be overkill.
    '';
    homepage = "http://www.litech.org/tayga";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ _0x4A6F ];
    platforms = platforms.linux;
    mainProgram = "tayga";
  };
})
