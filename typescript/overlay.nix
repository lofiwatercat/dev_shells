final: prev: {
  typescriptDevShell = prev.mkShell {
    packages = with prev; [
      git

      typescript
      typescript-language-server
      nodejs_24
      heroku
    ];

    shellHook = ''
      echo "Entered a typescript development environment"
    '';
  };
}
