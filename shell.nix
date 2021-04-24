let packages = import ./default.nix { };

in with packages;

haskellPackages.shellFor {
  packages = p: with p; [ simplePing ];
  buildInputs = with haskellPackages; [
    cabal-install
    hlint
    stylish-haskell
    haskell-language-server
  ];
  # withHoogle = true;
}
