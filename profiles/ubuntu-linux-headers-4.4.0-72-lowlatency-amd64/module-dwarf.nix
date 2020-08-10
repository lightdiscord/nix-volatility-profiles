{ stdenv, symlinkJoin, callPackage, dwarfdump }:

let

  headers = symlinkJoin {
    name = "linux-headers";
    paths = [
      (callPackage ./headers-lowlatency-amd64.nix { })
      (callPackage ./headers.nix { })
    ];
  };

in

stdenv.mkDerivation {
  pname = "module-dwarf";
  version = "4.4.0-72-lowlatency-amd64";

  src = callPackage ../../tools/volatility-linux.nix { };

  buildInputs = [ dwarfdump ];

  makeFlags = [
    "-f Makefile.enterprise"
    "KDIR=${headers}/linux-headers-4.4.0-72-lowlatency"
  ];

  installPhase = ''
    install -Dm444 -t $out module.dwarf
  '';
}
