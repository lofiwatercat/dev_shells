{
  description = "Nix flake dev environments";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      allSystems = [
        "x86_64-linux" # 64-bit Intel/AMD Linux
        "aarch64-linux" # 64-bit ARM Linux
        "x86_64-darwin" # 64-bit Intel macOS
        "aarch64-darwin" # 64-bit ARM macOS
      ];

      # Import language overlays
      rustOverlay = import ./rust/overlay.nix;
      cOverlay = import ./c/overlay.nix;
      nixOverlay = import ./nix/overlay.nix;

      overlays = [ 
        rustOverlay 
        cOverlay 
        nixOverlay
      ];

      forAllSystems =
        f:
        nixpkgs.lib.genAttrs allSystems (system: f { pkgs = import nixpkgs { inherit system overlays; }; });
    in
    {
      devShells = forAllSystems (
        { pkgs }:
        {
          # Insert new languages here
          rust = pkgs.rustDevShell;
          c = pkgs.cDevShell;
          nix = pkgs.nixDevShell;
        }
      );
    };
}
