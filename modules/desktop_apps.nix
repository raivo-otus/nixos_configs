{pkgs, ...}: {
  # Enable firefox
  programs.firefox.enable = true;

  # Desktop applications
  environment.systemPackages = with pkgs; [
    discord
    whipper
    beets
    stow
    s-tui
    btop
    quodlibet-full
    fastfetch
    pv
    bc
    tree
    jellyfin-desktop
    starship
  ];

  # Firmware updater
  services.fwupd.enable = true;

  # Enable flatpak
  services.flatpak.enable = true;
}
