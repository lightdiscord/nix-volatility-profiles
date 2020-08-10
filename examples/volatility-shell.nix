let
  pkgs = import <nixpkgs> {
    overlays = [
      (import ../overlay.nix)
    ];
  };

  profiles = pkgs.volatility-profiles.ubuntu-linux-headers-4-4-0-72-lowlatency-amd64;
in
  pkgs.mkShell {
    buildInputs = [
      pkgs.volatility
    ];

    shellHook = ''
      alias vol.py='vol.py --plugins="${profiles}"'
    '';
  }
