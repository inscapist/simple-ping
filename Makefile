.PHONY: derive nixbuild clean docker

# make
build: clean derive 
	nix-build

# make install
install:
	nix-env -i -f .

derive:
	cabal2nix .	> cabal.nix

clean:
	rm -f result

docker: clean
	nix-build docker.nix --builders 'ssh://arch x86_64-linux'
	docker rmi --force simple-ping
	docker load < result
