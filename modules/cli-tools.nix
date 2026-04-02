{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    whipper
    beets
    stow
    s-tui
    btop
    fastfetch
    pv
    bc
    tree
  ];
}
