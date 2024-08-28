{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    py = pkgs.python3.pkgs;
  in 
  {
  devShells.${system}.default = 
  pkgs.mkShell
    {
      packages = with pkgs; [
        python3
        fish
        py.pyperclip
        py.pip
      ];

      shellHook = ''
        exec fish
      '';
    };
  };
}

