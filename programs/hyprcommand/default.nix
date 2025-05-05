# default.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "hyprcommand";
  version = "1.0";

  src = ./.;

  nativeBuildInputs = [ pkgs.makeWrapper ];

  buildPhase = ''
    substituteAll hyprcommand.sh hyprcommand
    chmod +x hyprcommand
  '';

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/bin/scripts
    cp -r scripts/* $out/bin/scripts/
    cp hyprcommand $out/bin/

    wrapProgram $out/bin/hyprcommand \
      --prefix PATH : ${pkgs.jq}/bin:${pkgs.socat}/bin
  '';

  meta = {
    description = "Script runner with packaged commands";
    license = pkgs.lib.licenses.mit;
  };

  bash = "${pkgs.bash}/bin/bash";
  python3 = "${pkgs.python3}/bin/python3";
}

