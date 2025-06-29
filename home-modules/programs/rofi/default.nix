{ home, pkgs, xdg, ... }:

{
  home.packages = with pkgs; [ rofi ];
  xdg = {
    enable = true;
    configFile = {
      rofi.source = ./config;
    };
  };
}
