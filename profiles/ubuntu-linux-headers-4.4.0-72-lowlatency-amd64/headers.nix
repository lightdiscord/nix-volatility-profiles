{ stdenv, fetchurl, dpkg }:

stdenv.mkDerivation {
  pname = "linux-headers";
  version = "4.4.0-72";

  src = fetchurl {
    url = "mirror://ubuntu/pool/main/l/linux/linux-headers-4.4.0-72_4.4.0-72.93_all.deb";
    sha256 = "0ynbl4dr1k0528wc8qwiq7253hznw3rkf2qmvlga2yb5yms8r641";
  };

  nativeBuildInputs = [ dpkg ];

  unpackPhase = ''
    dpkg-deb -x $src .
  '';

  installPhase = ''
    cp -rf usr/src $out
  '';
}
