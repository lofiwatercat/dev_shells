self: super: {
  rustDevShell = super.mkShell {
    packages = with super; [
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
