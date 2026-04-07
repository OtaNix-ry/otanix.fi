{
  nixpkgs ? <nixpkgs>,
  pkgs ? import nixpkgs { },
  lib ? pkgs.lib,
}:
let
  tola = pkgs.callPackage ./nix/tola.nix { };
in
{
  web = pkgs.stdenvNoCC.mkDerivation {
    name = "otanix-fi";
    src =
      let
        fs = lib.fileset;
      in
      fs.toSource {
        root = ./.;
        fileset = fs.unions (
          map fs.maybeMissing [
            ./content
            ./assets
            ./templates
            ./components
            ./tola.toml
          ]
        );
      };
    nativeBuildInputs = [ tola ];
    buildPhase = "tola build";
    installPhase = "cp -r public $out";
  };
  shell = pkgs.mkShellNoCC {
    packages = [
      tola
    ];
  };
}
