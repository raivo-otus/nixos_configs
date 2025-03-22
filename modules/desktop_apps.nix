{ pkgs, ... }:

{
  programs.firefox.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    discord
    whipper
    beets
    stow
    s-tui
    btop
    r2modman
    quodlibet-full
    vscode.fhs
  ];

  services.flatpak.enable = true;

}
