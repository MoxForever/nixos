{ pkgs, users, ... }:

{
  users.users.root.shell = pkgs.fish;
  users.users.moxforever = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  imports = [
    (import ./home-modules/home.nix { users = [ users.users.moxforever ]; })
  ];
}
