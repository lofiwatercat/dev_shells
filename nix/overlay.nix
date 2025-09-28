final: prev: {
  nixDevShell = prev.mkShell {
    packages = with prev; [
      git
      
      nil
    ];

    shellHook = ''
      echo "Entered a nix development environment"
    '';
  };
}
