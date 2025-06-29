{ config, boot, lib, pkgs, programs, hardware, ... }:

{
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = true;
      finegrained = false;
    };
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.variables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GL_GSYNC_ALLOWED = "1";
    __GL_VRR_ALLOWED = "1";
  };

  services.xserver = {
    videoDrivers = [ "nvidia" ];
    displayManager.gdm.wayland = programs.hyprland.enable;
  };

  boot.kernelParams = [ "nvidia-drm.modeset=1" ];
}