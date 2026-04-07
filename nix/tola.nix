{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  nasm,
  perl,
}:
rustPlatform.buildRustPackage {
  pname = "tola";
  version = "0.7.1";

  src = fetchFromGitHub {
    owner = "tola-rs";
    repo = "tola-ssg";
    # Pin to v0.7.1
    rev = "v0.7.1";
    hash = "sha256-zgPKsIRXp5na2d0X7j5+9xJBGFSlvIKIRmzVVo/dcLk=";
  };

  cargoHash = "sha256-3Y7+UJD2QyNs+GjijvOAyTQ9ZP7lRf/MpaWThN2/e5s=";

  nativeBuildInputs = [
    pkg-config
    nasm
    perl
  ];

  buildInputs = [
    openssl
  ];

  doCheck = false;

  meta = {
    description = "A static site generator for Typst";
    homepage = "https://github.com/tola-rs/tola-ssg";
    license = lib.licenses.mit;
    mainProgram = "tola";
  };
}
