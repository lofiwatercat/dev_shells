# File: x11/overlay.nix

final: prev:
let
  # 1. Define the necessary packages in a clear, external list.
  x11Packages = with final; [
    # Build Tools (using final for safety if these are overlaid)
    cmake
    stdenv.cc
    pkg-config
    git
    
    # X11 and Graphics Libraries
    xorg.libX11
    xorg.libXrandr
    xorg.libXinerama
    xorg.libXcursor
    xorg.libXi
    mesa # Use mesa for OpenGL development
  ];
  
  # 2. Define the path helper based on the package list
  pkgConfigPaths = prev.lib.makeBinPath x11Packages + "/lib/pkgconfig";

in {
  x11DevShell = prev.mkShell {
    name = "x11-glfw-dev-shell";

    # Use the defined list directly
    packages = x11Packages;

    shellHook = ''
      # 3. Include the crucial fix for remote X11 discovery
      export PKG_CONFIG_PATH="${pkgConfigPaths}:$PKG_CONFIG_PATH"
      
      echo "Entered X11 development environment."
    '';
  };
}
