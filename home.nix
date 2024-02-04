{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rileyl";
  home.homeDirectory = "/home/rileyl";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    ./user/starship.nix

    ];



      # Install & Configure Git
  programs.git = {
    enable = true;
    userName = "Riley Lucas";
    userEmail = "rclucas0@gmail.com";
  };
  #  programs.starship = {
#    enable = true;
#    settings = {
#      aws.style = "bold #ffb86c";
#      cmd_duration.style = "bold #f1fa8c";
#      directory.style = "bold #50fa7b";
#      hostname.style = "bold #ff5555";
#      git_branch.style = "bold #ff79c6";
#      git_status.style = "bold #ff5555";
#      username = {
#        format = "[$user]($style) on ";
#        style_user = "bold #bd93f9";
#      };
#      character = {
#        success_symbol = "[](bold #f8f8f2)";
#        error_symbol = "[](bold #ff5555)";
#      };
#    };
#  };





  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/rileyl/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
