{ pkgs, users, programs, ... }:

{
  users.users.root.shell = pkgs.fish;
  users.users.moxforever = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.fish.enable = true;

  imports = [
    (import ./home-modules/home.nix {
      usersList = [ "moxforever" ];
    })
  ];
}
