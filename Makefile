.PHONY: derive nixbuild clean docker

nixbuild: clean derive
	nix-build release.nix

derive:
	cabal2nix .	> cabal.nix

clean:
	rm -f result

docker: clean
	nix-build docker.nix --builders 'ssh://arch x86_64-linux'
	docker rmi --force simple-ping
	docker load < result
