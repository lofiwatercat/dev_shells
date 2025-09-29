final: prev: {
  cppDevShell = prev.mkShell {
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
      echo "Entered a cpp development environment"
    '';
  };
}
