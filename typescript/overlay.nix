final: prev: {
  typescriptDevShell = prev.mkShell {
    packages = with prev; [
      git

      typescript
      typescript-language-server
      nodejs_24
    ];

    shellHook = ''
      echo "Entered a typescript development environment"
    '';
  };
}
