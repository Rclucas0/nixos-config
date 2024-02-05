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


  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    font-awesome
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];

  environment.systemPackages = with pkgs; [
    alacritty aspell aspellDicts.en
    brave btop bibata-cursors
    discord dunst dmenu
    dracula-icon-theme dracula-theme
    fd flameshot
    gparted gcc gruvbox-gtk-theme gruvbox-dark-icons-gtk git gimp gnumake gnome.adwaita-icon-theme
    htop
    ispell
    kitty
    libsForQt5.kdenlive libsForQt5.qt5ct lsd lxappearance
    mpv
    newsboat neofetch neovim neovide nitrogen
    obs-studio OVMF
    pavucontrol papirus-icon-theme picom prismlauncher polkit_gnome
    qemu_full
    rofi rose-pine-icon-theme ripgrep
    sxhkd slock steam st sweet swtpm
    tela-circle-icon-theme thonny thunderbird
    vim
    yt-dlp
    xfce.thunar
  ];
}
