let
  mkShell = { pkgs, haskellPackages, simplePing }:
    haskellPackages.shellFor {
      packages = p: with p; [ simplePing ];
      buildInputs = with haskellPackages; [
        cabal-install
        hlint
        stylish-haskell
        haskell-language-server
      ];
      # withHoogle = true;
    };
in mkShell (import ./default.nix { })
