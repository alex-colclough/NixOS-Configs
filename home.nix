{ config, pkgs, ... }:

{
  home.username = "alex";
  home.homeDirectory = "/home/alex";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
       chromium
       git
       firefox
       neofetch
       alacritty
       kitty
       vim
       neovim
       flameshot
       waybar
       rofi-wayland
       dunst
       tldr
       starship
       hyprpaper
       dolphin
       pavucontrol
       syncthing
       zsh
       lsd
       wofi
       xdg-desktop-portal-hyprland
       flatpak
       metasploit
       wireplumber
      
 ];
 # Configure cursor theme
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 16;
  };

  # Configure git settings
  programs.git = {
    enable = true;
    userName = "acolclough53";
    userEmail = "acolclough53@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

#  programs.zsh = {
#    enable = true;
#   shellAliases = {
#     ll = "lsd -l";
#     ".." = "cd ..";
#     grep = "grep -n --color";
#   };
# };

  # Enable & Configure QT
  qt.enable = true;
  qt.platformTheme = "gtk";
  qt.style.name = "adwaita-dark";
  qt.style.package = pkgs.adwaita-qt;

  # GTK Theme settings
  gtk = {
    enable = true;
    font = {
      name = "Ubuntu";
      size = 12;
      package = pkgs.ubuntu_font_family;
   };
   iconTheme = {
     name = "Papirus-Dark";
     package = pkgs.papirus-icon-theme;
   };
   cursorTheme = {
     name = "Bibata-Modern-Ice";
     package = pkgs.bibata-cursors;
   };
   gtk3.extraConfig = {
     Settings = ''
     gtk-application-prefer-dark-theme=1
     '';
   };
   gtk4.extraConfig = {
     Settings = ''
     gtk-application-prefer-dark-theme=1
     '';
    };
   };
  
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
  home.sessionVariables = {
    EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
