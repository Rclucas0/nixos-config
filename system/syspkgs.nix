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

  programs.fish.vendor.completions.enable = true;

  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    font-awesome
    fira-code
    fira-code-symbols
  ];

  environment.systemPackages = with pkgs; [
    alacritty aspell aspellDicts.en asciiquarium
    brave btop
    cmake
    discord dunst dmenu
#    emacs
    emacsPackages.all-the-icons
    fd flameshot fish
    gparted gcc git gimp gnumake gnome.adwaita-icon-theme
    htop
    ispell
    kitty
    lolcat libsForQt5.kdenlive libsForQt5.qt5ct lsd lxappearance
    mpv
    newsboat neofetch neovim neovide nitrogen
    obs-studio OVMF
    pavucontrol picom prismlauncher polkit_gnome python3
    qemu_full
    rofi ripgrep
    sxhkd slock steam st swtpm
    thonny thunderbird
    vim
    yt-dlp
    xfce.thunar
  ];
}
