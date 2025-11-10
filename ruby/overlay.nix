final: prev: {
  rubyDevShell = prev.mkShell {
    packages = with prev; [
      git

      ruby
    ];

    shellHook = ''
      echo "Entered a ruby development environment"
    '';
  };
}
