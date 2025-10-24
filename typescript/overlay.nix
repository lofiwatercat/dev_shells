final: prev: {
  typescriptDevShell = prev.mkShell {
    packages = with prev; [
      git

      typescript
      typescript-language-server
    ];

    shellHook = ''
      echo "Entered a typescript development environment"
    '';
  };
}
