# File: ./x11/overlay.nix

final: prev:
let
  # 1. Define essential build and discovery tools
  buildTools = with final; [ # Use 'final' for safety
    cmake
    stdenv.cc
    gnumake
    pkg-config
    git
  ];

  # 2. Define the Libraries (X11, GLFW, and Graphics)
  x11DevPkgs = [
    final.glfw                 # Window and input handling
    final.mesa                 # Provides OpenGL headers (libGL)
    final.xorg.libX11          # Core X11
    final.xorg.libXrandr       # Screen/window resolution
    final.xorg.libXcursor      # Mouse cursor handling
    final.xorg.libXinerama     # Multi-monitor support
    final.xorg.libXi           # X Input extension
  ];

  # 3. Combine all packages
  allDevPkgs = buildTools ++ x11DevPkgs;
  
  # 4. CRITICAL: Helper to collect all required 'pkgconfig' directories
  pkgConfigPaths = final.lib.makeBinPath allDevPkgs + "/lib/pkgconfig";
  
  # 5. ADVANCED: Helper to collect all 'include' and 'lib' paths
  libraryPaths = final.lib.makeBinPath allDevPkgs;

in {
  x11DevShell = prev.mkShell {
    name = "x11-glfw-opengl-dev-shell";

    # Add the special function to fix OpenGL driver loading
    packages = allDevPkgs ++ [ final.addDriverRunpath ]; 

    shellHook = ''
      echo "=========================================================="
      echo "  Entering X11/GLFW/OpenGL Development Shell"

      # 1. EXPLICIT FIX: PKG_CONFIG_PATH ensures CMake finds X11 and Mesa metadata.
      export PKG_CONFIG_PATH="${pkgConfigPaths}:$PKG_CONFIG_PATH"
      
      # 2. ROBUST FIX: Explicitly set compiler/linker paths
      export C_INCLUDE_PATH="${libraryPaths}/include:$C_INCLUDE_PATH"
      export LIBRARY_PATH="${libraryPaths}/lib:$LIBRARY_PATH"

      # LD_LIBRARY_PATH fix (optional, but robust)
      export LD_LIBRARY_PATH="/run/opengl-driver/lib:/run/opengl-driver-32/lib:$LD_LIBRARY_PATH"

      echo "  All necessary X11 and OpenGL libraries and drivers are now discoverable."
      echo "=========================================================="
    '';
  };
}
