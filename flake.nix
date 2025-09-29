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
      cppOverlay = import ./cpp/overlay.nix;
      nixOverlay = import ./nix/overlay.nix;
      latexOverlay = import ./latex/overlay.nix;

      overlays = [ 
        rustOverlay 
        cOverlay 
        cppOverlay
        nixOverlay
        latexOverlay
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
          cpp = pkgs.cppDevShell;
          nix = pkgs.nixDevShell;
          latex = pkgs.latexDevShell;
        }
      );
    };
}
