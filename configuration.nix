{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nix.nix
      ./users.nix
      ./system.nix
      ./modules/hyprland.nix
      ./modules/gdm.nix
      ./modules/pipewire.nix
      ./modules/fonts.nix
      ./modules/utils.nix
    ];
}
