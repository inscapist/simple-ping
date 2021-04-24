{ compiler ? "ghc8104", sources ? import ./nix/sources.nix }:

with { overlay = _: pkgs: { niv = (import sources.niv { }).niv; }; };

rec {
  pkgs = import sources.nixpkgs {
    overlays = [ overlay ];
    config = { };
  };
  haskellPackages = pkgs.haskell.packages.${compiler};
  simplePing = haskellPackages.callPackage ./cabal.nix { };
}
