{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-support/default.nix
      ./boot/default.nix
      ./nix.nix
      ./system.nix
      ./users.nix
    ];
}
