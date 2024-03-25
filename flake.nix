{  description = "Full NixOS configuration (still in evaulation phase)";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    cflags = "-std=c99 -pedantic -Wall -Wextra -Os";
    lflags = "-lm";
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
      packages.${system}.default = pkgs.callPackage (import ./.) {};
    };
}
