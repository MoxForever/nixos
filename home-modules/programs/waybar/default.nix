{ home, pkgs, xdg, ... }:

{
  home.packages = with pkgs; [ waybar ];
  xdg = {
    enable = true;
    configFile = {
      waybar.source = ./config;
    };
  };
}
