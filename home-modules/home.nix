{ usersList }:

{ config, lib, pkgs, ... }:

let
  inherit (lib) mkIf mkMerge filterAttrs hasAttr pathExists tryEval isAttrs;

  defaultHomeConfig = import ./home-default.nix;
  isValidHomeConfig = cfg:
    isAttrs cfg &&
    hasAttr "home.username" cfg &&
    hasAttr "home.stateVersion" cfg;

  getUserConfig = username:
    let
      homePath = "/home/${username}/.config/home-manager/home.nix";
      imported =
        if pathExists homePath then
          let result = tryEval (import homePath);
          in if result.success && isValidHomeConfig result.value
             then result.value
             else defaultHomeConfig
        else defaultHomeConfig;
    in {
      home-manager.users.${username} = imported;
    };

in {
  config = mkMerge (builtins.map getUserConfig usersList);
}
