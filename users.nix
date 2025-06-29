{ pkgs, users, ... }:

{
  users.users.root.shell = pkgs.fish;
  users.users.moxforever = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  imports = [
    (import ./home-modules/home.nix {
      usersList = [
        {
          name = "moxforever";
          isNormalUser = true;
        }
      ];
    })
  ];
}
