{nixpkgs? import <nixpkgs> {} }:
with nixpkgs;
let
  inherit (import (builtins.fetchTarball "https://github.com/hercules-ci/gitignore/archive/master.tar.gz") { }) gitignoreSource;
  gitshort =  assert builtins.pathExists ./.git; builtins.substring 0 7 (lib.commitIdFromGitRepo ./.git);
in
stdenv.mkDerivation rec {
  name = "datpx_deriv";
  version = gitshort;
  src = gitignoreSource ./.;
  nativeBuildInputs = [ cmake pkgconfig ];
  buildInputs = [
    tzdata
    boost
  ];
  CPATH = lib.makeSearchPathOutput "dev" "include" buildInputs;
  cmakeFlags = [
  ];
  enableParalellBuilding = true;
}
