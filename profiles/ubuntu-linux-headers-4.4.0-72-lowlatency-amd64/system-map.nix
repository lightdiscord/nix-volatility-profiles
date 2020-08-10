{ stdenv, fetchurl, dpkg }:

stdenv.mkDerivation {
  pname = "linux-system-map";
  version = "4.4.0-72-lowlatency-amd64";

  src = fetchurl {
    url = "mirror://ubuntu/pool/main/l/linux/linux-image-4.4.0-72-lowlatency_4.4.0-72.93_amd64.deb";
    sha256 = "0x77iqhxxvn8yj7ip6djppabjrdhirxfdkzcm7w30m2qpn6cvyvh";
  };

  nativeBuildInputs = [dpkg];

  unpackPhase = ''
    dpkg-deb -x $src .
  '';

  installPhase = ''
    install -Dm444 -t $out/boot boot/System.map-4.4.0-72-lowlatency
  '';
}
