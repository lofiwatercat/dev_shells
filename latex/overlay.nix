final: prev: {
  latexDevShell = prev.mkShell {
    packages = with prev; [
      git

      texlab
    ];

    shellHook = ''
      echo "Entered a latex development environment"
    '';
  };
}
