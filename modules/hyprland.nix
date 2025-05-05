{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprland alacritty waybar wofi copyq
  ];

  hardware.nvidia.open = true;
}
