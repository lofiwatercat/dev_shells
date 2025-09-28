final: prev: {
  rustDevShell = prev.mkShell {
    packages = with prev; [
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
