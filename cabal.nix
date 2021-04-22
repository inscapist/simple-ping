{ mkDerivation, base, http-types, lib, relude, wai, warp }:
mkDerivation {
  pname = "simple-ping";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base http-types relude wai warp ];
  homepage = "https://github.com/sagittaros/simple-ping";
  description = "A simple ping that returns 200";
  license = lib.licenses.mit;
}
