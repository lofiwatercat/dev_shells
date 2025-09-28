final: prev: {
  cDevShell = prev.mkShell {
    packages = with prev; [
      git

      libclang
      gcc      
    ];

    shellHook = ''
      echo "Entered a c development environment"
    '';
  };
}
