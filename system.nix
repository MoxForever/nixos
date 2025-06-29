{ boot, networking, time, i18n, system, hardware, pkgs, services, options, ... }:

{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelParams = [ "mem_sleep_default=deep" ];
  };

  networking = {
    hostName = "moxforever";
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
    networkmanager.enable = true;
    networkmanager.plugins = with pkgs; [ networkmanager-openconnect ];
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    pulseaudio.enable = false;
  };

  powerManagement.enable = true;

  services = {
    upower.enable = true;
    geoclue2.enable = true;
    colord.enable = true;
    dbus.enable = true;
    automatic-timezoned.enable = true;
    avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
    };
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services = {
      login.enable = true;
      gdm.enable = true;
      sshd.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [ ibus ];

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings.LC_TIME = "en_GB.UTF-8";
  };

  system = {
    autoUpgrade.enable = true;
    stateVersion = "25.05";
  };
}
