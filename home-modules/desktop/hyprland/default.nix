{ environment, programs, pkgs, systemd, hardware, ... }:

let
  hyprcommand-pkg = pkgs.callPackage ./../../../custom-programs/hyprcommand/default.nix {};
  mint-theme = pkgs.callPackage ./../../../custom-programs/mint-theme/default.nix {};
in

{
  imports = [
    ../../programs/alacritty/default.nix
    ../../programs/rofi/default.nix
    ../../programs/waybar/default.nix
    ../../programs/utils.nix
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprland hyprpaper hyprlock hypridle 
    hyprpicker hyprshot hyprcommand-pkg
    hyprpolkitagent bibata-cursors wlogout
  ];
  
  security.pam.services.hyprlock.allowNullPassword = false;

  home = {
    pointerCursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };
    sessionVariables = {
      XCURSOR_THEME = "Bibata-Modern-Ice";
      XCURSOR_SIZE = "24";
    };
  };

  xdg = {
    portal = with pkgs; {
      enable = true;
      extraPortals = [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
      configPackages = [ xdg-desktop-portal-hyprland ];
    };
    configFile = {
      hypr.source = ./config;
    };
  };
}
