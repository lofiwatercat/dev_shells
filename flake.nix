{
  description = "Nix flake dev environments";

  outputs = { self }: {
    templates = {
      rust = {
        path = ./rust;
        description = "Rust development environment";
      };
    };
  };
}
