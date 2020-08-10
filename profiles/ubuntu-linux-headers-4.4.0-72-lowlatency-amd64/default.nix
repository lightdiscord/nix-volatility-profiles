{ stdenv, symlinkJoin, callPackage, zip }:

stdenv.mkDerivation {
  pname = "ubuntu-profile";
  version = "4.4.0-72-lowlatency-amd64";

  srcs = symlinkJoin {
    name = "ubuntu-profile-requirements";
    paths = [
      (callPackage ./module-dwarf.nix { })
      (callPackage ./system-map.nix { })
    ];
  };

  buildInputs = [ zip ];

  installPhase = ''
    mkdir -p $out
    zip -r $out/Ubuntu-4.4.0-72-lowlatency-amd64.zip module.dwarf boot
  '';
}
