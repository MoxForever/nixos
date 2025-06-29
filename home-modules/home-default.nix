{ config, pkgs, ... }:

{
  programs.fish.enable = true;

  home.packages = with pkgs; [
    neovim
    htop
    wget
  ];

  home.stateVersion = "25.05";
}