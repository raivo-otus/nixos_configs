{ pkgs, ... }:

{

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    caffeine
    space-bar
    just-perfection
    appindicator
    search-light
    paperwm
  ];

}
