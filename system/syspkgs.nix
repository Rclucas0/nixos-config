{config, pkgs, ...}:

{
  # Enable Dconf
  programs.dconf.enable = true;

   # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Enable and Start emacs daemon
  services.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  environment.systemPackages = with pkgs; [
    alacritty
    brave btop bibata-cursors
    discord dunst dmenu
    dracula-icon-theme dracula-theme
    fd
    gparted gcc gruvbox-gtk-theme gruvbox-dark-icons-gtk git gimp gnumake gnome.adwaita-icon-theme
    htop
    kitty
    libsForQt5.kdenlive libsForQt5.qt5ct lsd lxappearance
    mpv
    newsboat neofetch neovim nitrogen
    pavucontrol papirus-icon-theme picom prismlauncher
    qemu_full
    rofi rose-pine-icon-theme ripgrep
    starship sxhkd slock steam st sweet
    tela-circle-icon-theme thonny thunderbird
    vim
    yt-dlp
    xfce.thunar
    obs-studio
  ];
}
