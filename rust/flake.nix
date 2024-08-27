{
  description = "A flake for Rust development";

  # GitHub URLs for the Nix inputs we're using
  inputs = {
    # Simply the greatest package repository on the planet
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # A set of helper functions for using flakes
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ...  }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        # System-specific nixpkgs 
        pkgs = import nixpkgs { inherit system ; };
      in {
        devShells = {
          default = pkgs.mkShell {
            # Packages included in the environment
            buildInputs = with pkgs; [
              rustc
              cargo
              rustfmt
              rust-analyzer
              openssl
              pkg-config
            ];

            # Run when the shell is started up
            shellHook = ''
            '';
          };
        };
      });
}
