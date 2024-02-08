{ gtkThemeFromScheme, config, pkgs, inputs, gitEmail, gitUsername, username, theme, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  colorScheme = inputs.nix-colors.colorSchemes."${theme}";

  imports = [
   ./user/starship.nix
    ./user/bash.nix
    ./user/kitty.nix
    ./user/rofi.nix
    ./user/gtk-gt.nix
    inputs.nix-colors.homeManagerModules.default
  ];

  home.file.".config/rofi/rofi.jpg".source = ./user/rofi.jpg;
  home.file.".config/starship.toml".source = ./user/starship.toml;
  home.file.".face".source = ./user/face.jpg;


    # Install & Configure Git
  programs.git = {
    enable = true;
    userName = "${gitUsername}";
    userEmail = "${gitEmail}";
  };

  home.packages = [

  ];

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
