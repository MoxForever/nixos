# default.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "hyprcommand";
  version = "local";

  src = ./.;

  nativeBuildInputs = [ pkgs.makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin/scripts
    cp -r scripts/* $out/bin/scripts/
    cp hyprcommand.sh $out/bin/hyprcommand
    chmod +x $out/bin/hyprcommand
    chmod +x $out/bin/scripts/*

    patchShebangs $out/bin

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

