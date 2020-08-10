{ stdenv, volatility, unzip }:

stdenv.mkDerivation {
  pname = "volatility-tools-linux";
  version = volatility.version;

  src = volatility.src;

  nativeBuildInputs = [unzip];

  dontBuild = true;

  installPhase = ''
    cp -rf tools/linux $out
  '';
}
