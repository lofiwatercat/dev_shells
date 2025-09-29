final: prev: {
  x11DevShell = prev.mkShell {
    packages = with prev; [
      git

      xorg.libX11
      xorg.libXrandr
    ];

    shellHook = ''
      echo "Entered a X11 development environment"
    '';
  };
}
