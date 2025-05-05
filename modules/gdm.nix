{ services, ... }:

{
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    displayManager = {
      gdm.enable = true;
      gdm.wayland = true;
      startx.enable = true;
    };
  };
}
