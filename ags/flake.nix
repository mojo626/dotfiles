{
  description = "My AGS widgets development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    ags.url = "github:aylur/ags";
  };

  outputs = { self, nixpkgs, ags, ... }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = [
          ags.packages.x86_64-linux.agsFull
          pkgs.nodejs_20
          pkgs.typescript-language-server
          pkgs.gjs
          pkgs.gobject-introspection
        ];

        shellHook = ''
          echo "🐚 AGS dev environment loaded"
        '';
      };
    };
}
