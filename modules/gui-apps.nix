{pkgs, ...}: {
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    ghostty
    quodlibet-full
    jellyfin-desktop
    discord
  ];

  environment.variables.TERMINAL = "ghostty";

  # Firmware updater
  services.fwupd.enable = true;

  # Enable Flatpaks
  services.flatpak.enable = true;
}
