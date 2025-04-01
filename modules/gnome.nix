{ pkgs, ... }:

{

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    caffeine
    space-bar
    dash-to-dock
    lockscreen-extension
    just-perfection
    appindicator
    switcher
  ];

}
