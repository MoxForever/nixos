{ environment, programs, pkgs, systemd, hardware, ... }:

let
  hyprcommandPkg = pkgs.callPackage ./../programs/hyprcommand/default.nix {};
in

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprland hyprpaper hyprlock hypridle hyprpicker hyprshot hyprcommandPkg hyprpolkitagent
    alacritty waybar rofi copyq socat swaynotificationcenter resources
  ];

  hardware.nvidia.open = true;
}
