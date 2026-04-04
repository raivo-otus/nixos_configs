{pkgs, ...}: {
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    quodlibet-full
    jellyfin-desktop
    discord
  ];

  # Firmware updater
  services.fwupd.enable = true;

  # Enable Flatpaks
  services.flatpak.enable = true;
}
