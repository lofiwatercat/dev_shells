self: super: {
  latexDevShell = super.mkShell {
    packages = with super; [
      git

      texlab
    ];

    shellHook = ''
      echo "Entered a latex development environment"
    '';
  };
}
