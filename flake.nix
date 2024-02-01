{
  description = "My Nix Flake Configuration With Dwm";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

#    home-manager = {
#      url = "github:nix-community/home-manager";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };


  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };
        modules = [
          ./profiles/personal-dwm/configuration.nix
#          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
