{ config, pkgs, inputs, ... }:
{
  imports =
    [
      ../hardware.nix
     ../user/wm/dwm.nix
    ];
  system.stateVersion = "23.11";

  boot = {
   loader = {
     systemd-boot.enable = true;
     efi.canTouchEfiVariables = true;
   };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
  security.polkit.enable = true;

  time.timeZone = "America/Chicago";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.rileyl = {
    isNormalUser = true;
    description = "Riley Lucas";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "dialout" ];
    packages = with pkgs; [
    ];
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  services.openssh = {
    enable = true;
    # require public key authentication for better security
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    #settings.PermitRootLogin = "yes";
  };
  users.users."rileyl".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC+UQ9oe8uh0KpO5NwWejLa4/7Cg1YBobaKcyANLAAQw rileyl" # content of authorized_keys file
  # note: ssh-copy-id will add user@your-machine after the public key
  # but we can remove the "@your-machine" part
  ];

  environment.variables = {
    POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };

  nixpkgs.config.allowUnfree = true;

  virtualisation.libvirtd.enable = true;

  programs = {
    fish.vendor.completions.enable = true;
    virt-manager.enable = true;
    dconf.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  fonts.packages = with pkgs; [
    hack-font
    nerdfonts
    ubuntu_font_family
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
    emacsPackages.all-the-icons emacs-all-the-icons-fonts emacsPackages.treemacs-all-the-icons eww
    fd flameshot fish
    gparted gcc git gimp gnumake gnome.adwaita-icon-theme
    htop
    ispell
    kitty
    lolcat libsForQt5.kdenlive libsForQt5.qt5ct lsd lxappearance libtool
    lispPackages.quicklisp
    mpv
    newsboat neofetch neovim neovide nitrogen
    obs-studio OVMF
    pavucontrol picom prismlauncher polkit_gnome python3
    qemu_full
    rofi ripgrep
    sxhkd slock steam st swtpm slock swaylock swayidle swaynotificationcenter sbcl
    thonny thunderbird
    unzip
    vim
    xfce.thunar xorg.xmodmap xss-lock
    yt-dlp
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
    configPackages = [ pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal
    ];
  };

services = {
   blueman.enable = true;
    xserver = {
      enable = true;
      windowManager.exwm.enable = true;
      windowManager.stumpwm.enable = true;
      displayManager.gdm.enable = true;
      xkb = {
        variant = "";
        layout = "us";
      };
      libinput = {
        enable = true;
        mouse = {
          accelProfile = "flat";
        };
      };
    };
    emacs = {
      enable = true;
      package = pkgs.emacs;
    };
    syncthing = {
      enable = false;
      user = "rileyl";
      dataDir = "/home/rileyl/Documents";    # Default folder for new synced folders
      configDir = "/home/rileyl/Documents/.config/syncthing";   # Folder for Syncthing's settings and keys
      settings.gui = {
        user = "rileyl";
        password = "Lucas4321";
      };
    };
};
}
