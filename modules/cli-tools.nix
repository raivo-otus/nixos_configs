{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bc
    beets
    btop
    comma
    fastfetch
    pv
    s-tui
    stow
    tree
    whipper
  ];
}
