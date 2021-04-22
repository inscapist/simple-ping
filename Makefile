.PHONY: derive nixbuild clean

nixbuild: clean derive
	nix-build release.nix

derive:
	cabal2nix .	> cabal.nix

clean:
	rm -f result

