{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./hardware-support/default.nix
      ./boot/default.nix
      ./nix.nix
      ./system.nix
      ./users.nix
    ];
}
