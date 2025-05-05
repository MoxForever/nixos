{ boot, networking, time, i18n, system, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "moxforever";
  networking.networkmanager.enable = true;

  time.timeZone = "Azia/Bishkek";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings.LC_TIME = "en_GB.UTF-8";
  };

  system = {
    autoUpgrade.enable = true;
    stateVersion = "24.11";
  };
}
