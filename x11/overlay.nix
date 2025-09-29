final: prev: {
  x11DevShell = prev.mkShell {
    packages = with prev; [
      git

      pkg-config
      xorg.libX11
      xorg.libXrandr
      xorg.libXinerama
      xorg.libXcursor
      xorg.libXi
      xorg.Gl
    ];

    shellHook = ''
      echo "Entered a X11 development environment"
    '';
  };
}
