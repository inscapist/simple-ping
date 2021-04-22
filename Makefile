.PHONY: cabal2nix nixbuild nixshell

nixbuild: clean cabal2nix
	nix-build release.nix

nixshell: cabal2nix
	nix-shell release.nix

cabal2nix:
	cabal2nix .	> default.nix

clean:
	rm -f result

