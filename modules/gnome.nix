{pkgs, ...}: {
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm = {
    enable = true;
    autoLogin.enable = true;
    autoLogin.user = "rpth";
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
