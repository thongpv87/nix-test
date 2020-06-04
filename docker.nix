#{ system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { };
  callPackage = pkgs.lib.callPackageWith pkgs;
  nixTest = callPackage ./default.nix { };
in
with pkgs;
dockerTools.buildImage {
  name = "nix-test";
  tag = "latest";

  runAsRoot = ''
    #!${stdenv.shell}
    mkdir -p /usr/share
    ln -s /share/zoneinfo /usr/share/zoneinfo
  '';

  contents = [ tzdata bash nixTest];
  config = {
    #EntryPoint = [ "${datPxDeriv}/bin/main"];
    ExposedPorts = {
    };
  };
}
