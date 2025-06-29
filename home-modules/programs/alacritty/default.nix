{ home, pkgs, xdg, ... }:

{
  home.packages = with pkgs; [ alacritty ];
  xdg = {
    enable = true;
    configFile = {
      alacritty.source = ./config;
    };
  };
}
