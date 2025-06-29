{ home, pkgs, xdg, ... }:

{
  home.packages = with pkgs; [ swaynotificationcenter ];
  xdg = {
    enable = true;
    configFile = {
      swaync.source = ./config;
    };
  };
}
