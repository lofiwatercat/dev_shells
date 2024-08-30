self: super: {
  rustDevShell = super.mkShell {
    packages = with super; [
      git
      
      rustc
      cargo
      rustfmt
      rust-analyzer
      openssl
      pkg-config
    ];

    shellHook = ''
      echo "Entered a rust development environment"
    '';
  };
}
