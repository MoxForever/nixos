{ fonts, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    fira-code fira-code-symbols fira-sans
    noto-fonts noto-fonts-cjk-sans noto-fonts-emoji
    papirus-icon-theme font-awesome
  ];
}
