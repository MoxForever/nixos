{ username }:

{ lib, home, xdg, pkgs, nixpkgs, ... }:

let
  configDir = ./config;
  configEntries = builtins.readDir configDir;

  configFiles = lib.mapAttrs' (name: type: {
    name = name;
    value.source = configDir + "/${name}";
  }) configEntries;
in

{
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
    packages = with pkgs; [
      telegram-desktop obs-studio firefox vscode
      (callPackage ../theme { }) mint-y-icons
    ];
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "vscode" ];

  xdg.configFile = configFiles;

  gtk = {
    enable = true;
    theme.name = "Mint-Y-Dark-Purple";
    iconTheme.name = "Mint-Y-Purple";
  };
}
