{pkgs ? import <nixpkgs>, ...}: let
  cflags = "-std=c99 -pedantic -Wall -Wextra -Os";
  lflags = "-lm";
in
  pkgs.stdenv.mkDerivation {
    name = "backlight";
    src = ./backlight.c;

    buildPhase = ''
      $CC -o backlight ${cflags} ${lflags} $src/backlight.c
    '';
    installPhase = ''
      install -D backlight "$out/bin/backlight"
    '';
  }
