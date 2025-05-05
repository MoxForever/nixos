{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "mint-themes";
  version = "local";

  src = ./.;

  nativeBuildInputs = with pkgs; [
    python3
    python3Packages.libsass
  ];

  buildPhase = ''
    echo "Running generate-themes.py..."
    python3 generate-themes.py
  '';

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r usr/share/themes/* $out/share/themes/
  '';

  meta = with pkgs.lib; {
    description = "Locally built mint-themes with color customization";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ yourName ];
    platforms = platforms.linux;
  };
}
