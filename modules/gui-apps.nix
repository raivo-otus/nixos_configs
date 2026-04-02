{pkgs, ...}: {
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    quodlibet-full
    jellyfin-desktop
  ];

  # Firmware updater
  services.fwupd.enable = true;

  # Flatpak
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [
      "com.discordapp.Discord"
    ];
  };
}
