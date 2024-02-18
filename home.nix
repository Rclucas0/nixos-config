{ gtkThemeFromScheme, config, pkgs, inputs, gitEmail, gitUsername, username, theme, ... }:
{
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
    ./user/hyprland.nix
    ./user/waybar.nix
    ./user/swaylock.nix
    ./user/swaync.nix
    inputs.nix-colors.homeManagerModules.default
    inputs.hyprland.homeManagerModules.default
  ];

  home.file.".config/rofi/rofi.jpg".source = ./user/rofi.jpg;
  home.file.".config/starship.toml".source = ./user/starship.toml;
  home.file.".config/sxhkd/sxhkdrc".source = ./user/sxhkdrc;
  home.file.".config/doom/" = {
    source = ./user/doom;
    recursive = true;
  };
  home.file.".config/stumpwm/" = {
    source = ./user/wm/stumpwm;
    recursive = true;
  };

  # Define Settings For Xresources
  xresources.properties = {
    "Xcursor.size" = 24;
  };

    # Install & Configure Git
  programs.git = {
    enable = true;
    userName = "${gitUsername}";
    userEmail = "${gitEmail}";
  };

  # Create XDG Dirs
  xdg = {
    userDirs = {
        enable = true;
        createDirectories = true;
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  programs.home-manager.enable = true;
}
