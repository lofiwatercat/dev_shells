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
      mesa
    ];

    shellHook = ''
      export PKG_CONFIG_PATH="${prev.lib.makeBinPath prev.packages}/lib/pkgconfig:$PKG_CONFIG_PATH"
      echo "Entered a X11 development environment"
    '';
  };
}
