.PHONY: derive nixbuild clean

nixbuild: clean cabal2nix
	nix-build release.nix

derive:
	cabal2nix .	> cabal.nix

clean:
	rm -f result

