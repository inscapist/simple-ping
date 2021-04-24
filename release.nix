{ compiler ? "ghc8103", pkgs ? import <nixpkgs> { } }:

let
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
