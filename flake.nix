{
  description = "lackluster - a minimal colour scheme";

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      perSystem = {pkgs, ...}: {
        # Development environment
        devShells.default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            # Lua
            stylua
            lua-language-server

            # Nix
            nixd
            alejandra
            statix
            deadnix
          ];
        };

        # Formatting for the whole codebase
        treefmt = {
          # Used to find the project root
          projectRootFile = ".git/config";
          programs = {
            alejandra.enable = true;
            # set up stylua to use the settings defined in stylua.toml
            stylua = {
              enable = true;
              settings = fromTOML (builtins.readFile ./stylua.toml);
            };
          };
        };
      };

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      imports = [
        inputs.treefmt-nix.flakeModule
      ];
    };

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
}
