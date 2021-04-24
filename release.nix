{ compiler ? "ghc8104", sources ? import ./nix/sources.nix }:

with { overlay = _: pkgs: { niv = (import sources.niv { }).niv; }; };

let
  pkgs = import sources.nixpkgs {
    overlays = [ overlay ];
    config = { };
  };
  haskellPackages = pkgs.haskell.packages.${compiler};
  project = haskellPackages.callPackage ./cabal.nix { };
in {
  project = project;
  shell = haskellPackages.shellFor {
    packages = p: with p; [ project ];
    buildInputs = with haskellPackages; [
      cabal-install
      hlint
      stylish-haskell
      haskell-language-server
    ];
    # withHoogle = true;
  };
}
