{ home, pkgs, xdg, ... }:

{
  home.packages = with pkgs; [ htop ];
  xdg = {
    enable = true;
    configFile = {
      htop.source = ./config;
    };
  };
}
