{ services, environment, programs, pkgs, ... }:

{
  services.xserver.excludePackages = with pkgs; [ xterm ];
  environment.systemPackages = with pkgs; [
    vim mesa libglvnd vscode firefox nemo telegram-desktop
    neofetch git python3 gparted htop
  ];

  programs = {
    appimage.enable = true;
    fish = {
      enable = true;
      shellInit = ''
        set -U fish_greeting ""
      '';
    };
  };
}
