self: super: {
  cDevShell = super.mkShell {
    packages = with super; [
      git

      libclang
      gcc      
    ];

    shellHook = ''
      echo "Entered a c development environment"
    '';
  };
}
