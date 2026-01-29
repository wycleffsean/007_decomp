{
  description = "Nix flake for MIPS development tools";

  nixConfig = {
      allowUnsupportedSystem = true;
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11"; # You can specify a different branch or commit if needed
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachSystem [
      "x86_64-linux"
      "aarch64-linux"
  ] (system: let
    pkgs = import nixpkgs {
        inherit system;
    };
    in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            # pkgs.pkgsCross.mips-embedded.binutilsNoLibc
            pkgs.pkgsCross.mips-embedded.buildPackages.binutils
            pkgs.capstone
            pkgs.python314
          ];

          shellHook = ''
              export PKG_CONFIG_PATH=${pkgs.capstone}/lib/pkgconfig
          '';
        };
      }
  );
}
