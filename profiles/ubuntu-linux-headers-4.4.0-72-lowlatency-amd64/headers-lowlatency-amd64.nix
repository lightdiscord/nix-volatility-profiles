{ stdenv, fetchurl, dpkg, autoPatchelfHook, openssl_1_0_2 }:

stdenv.mkDerivation {
  pname = "linux-headers";
  version = "4.4.0-72-lowlatency-amd64";

  src = fetchurl {
    url = "mirror://ubuntu/pool/main/l/linux/linux-headers-4.4.0-72-lowlatency_4.4.0-72.93_amd64.deb";
    sha256 = "1a8fljpm2g6hcfdzwbvfhm3jvp05cqidzxknyppscbxzs3sx5ns1";
  };

  nativeBuildInputs = [ dpkg autoPatchelfHook ];

  buildInputs = [
    # Ignore security disclaimer.
    (openssl_1_0_2.overrideAttrs (_: { meta = {}; }))
  ];

  unpackPhase = ''
    dpkg-deb -x $src .
  '';

  installPhase = ''
    cp -rf usr/src $out
  '';
}
