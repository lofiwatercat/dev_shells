self: super: {
  nixDevShell = super.mkShell {
    packages = with super; [
      git
      
      nil
    ];

    shellHook = ''
      echo "Entered a nix development environment"
    '';
  };
}
