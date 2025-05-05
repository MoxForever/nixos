{ services, environment, programs, pkgs, ... }:

{
  services.xserver.excludePackages = with pkgs; [ xterm ];
  environment.systemPackages = with pkgs; [
    vim mesa libglvnd nemo neofetch git python3 python3Packages.pip gparted htop
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
