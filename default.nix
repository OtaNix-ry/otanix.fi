{
  nixpkgs ? <nixpkgs>,
  pkgs ? import nixpkgs { },
  lib ? pkgs.lib,
}:
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
            ./static
            ./templates
            ./config.toml
            ./CNAME
          ]
        );
      };
    buildPhase = "${pkgs.lib.getExe pkgs.pkgsBuildHost.zola} build";
    installPhase = "cp -r public $out";
  };
  shell = pkgs.mkShellNoCC {
    packages = [
      pkgs.zola
    ];
  };
}
