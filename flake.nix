{
  description = "ZaneyOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{ nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";

    # User Variables
    hostname = "nixos";
    username = "rileyl";
    gitUsername = "Riley Lucas";
    gitEmail = "rclucas0@gmail.com";

    pkgs = import nixpkgs {
      inherit system;
      config = {
	    allowUnfree = true;
      };
    };
  in {
    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {
	    specialArgs = {
          inherit system; inherit inputs;
          inherit username; inherit hostname;
          inherit gitUsername; inherit gitEmail;
        };
	    modules = [ ./profiles/personal-dwm/configuration.nix
          home-manager.nixosModules.home-manager {
	        home-manager.extraSpecialArgs = {
              inherit username; inherit gitEmail;
              inherit inputs; inherit gitUsername;
            };
	        home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
	        home-manager.users.${username} = import ./home.nix;
	      }
	    ];
      };
    };
  };
}
