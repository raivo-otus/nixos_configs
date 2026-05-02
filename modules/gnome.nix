{pkgs, ...}: {
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm = {
    enable = true;
  };

  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    caffeine
    space-bar
    just-perfection
    appindicator
    search-light
  ];
}
