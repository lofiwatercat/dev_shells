final: prev: {
  cDevShell = prev.mkShell {
    packages = with prev; [
      git

      clang-tools
      cmake
      codespell
      conan
      cppcheck
      doxygen
      gtest
      lcov
      vcpkg
      vcpkg-tool
    ];

    shellHook = ''
      echo "Entered a c development environment"
    '';
  };
}
