final: prev: {
  x11DevShell = prev.mkShell {
    packages = with prev; [
      git

      pkg-config
      libx11
      libxrandr
      libxinerama
      libxcursor
      libxi
    ];

    shellHook = ''
      echo "Entered a X11 development environment"
    '';
  };
}
