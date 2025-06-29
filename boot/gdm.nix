{ services, environment, pkgs, ... }:

{
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    displayManager = {
      gdm = { 
        enable = true;
        wayland = programs.hyprland.enable;
      };
      startx.enable = true;
    };
  };

  systemd.services.systemd-oomd.enable = true;
}
