{ pkgs, users, builtins, ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  users.users.moxforever = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager.users.moxforever = import ./home/home.nix {
    username = "moxforever";
  };
}
