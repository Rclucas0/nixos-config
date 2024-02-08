{
  description = "My Dwm Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
  };
  outputs = inputs@{ nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";

    # User Variables
    hostname = "nixos";
    username = "rileyl";
    gitUsername = "Riley Lucas";
    gitEmail = "rclucas0@gmail.com";
    flakeDir = "/home/${username}/nixos-config";
    theme = "gruvbox-material-dark-hard";

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
          inherit flakeDir;
        };
	    modules = [ ./profiles/personal-dwm/configuration.nix
          home-manager.nixosModules.home-manager {
	        home-manager.extraSpecialArgs = {
              inherit username; inherit gitEmail;
              inherit inputs; inherit gitUsername;
              inherit flakeDir; inherit theme;
              inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;
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
