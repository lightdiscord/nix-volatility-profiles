self: super:

{
  volatility = super.callPackage ./nix-volatility-unstable { };

  volatility-profiles = {
    ubuntu-linux-headers-4-4-0-72-lowlatency-amd64
      = self.callPackage ./profiles/ubuntu-linux-headers-4.4.0-72-lowlatency-amd64 { };
  };
}
