{ username }:

{ lib, home, xdg, ... }:

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
  };

  xdg.configFile = configFiles;
}
