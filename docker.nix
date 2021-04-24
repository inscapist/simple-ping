{ compiler ? "ghc8104", pkgs ? import <nixpkgs> { system = "x86_64-linux"; } }:
# i am using distributed build on another machine, since i am running Mac

with pkgs;
with dockerTools;

let

  haskellPackages = haskell.packages.${compiler};
  project = haskellPackages.callPackage ./cabal.nix { };

in buildLayeredImage {
  name = "simple-ping";

  # tag = "0.1.0.0";
  tag = "latest";

  contents = [ project ];

  config = {
    Cmd = [ "simple-ping" ];
    ExposedPorts = { "3000/tcp" = { }; };
  };
}
