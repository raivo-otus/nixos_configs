{ pkgs, ... }:

{
  # Enable firefox
  programs.firefox.enable = true;
  
  # Enable neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  
  # Desktop applications
  environment.systemPackages = with pkgs; [
    discord
    whipper
    beets
    stow
    s-tui
    btop
    quodlibet-full
    vscode.fhs
    obsidian
    mattermost
    lazydocker
    lazygit
  ];
  
  # Enable flatpak
  services.flatpak.enable = true;

  # Docker
  virtualisation.docker.enable = true;
    virtualisation.docker.daemon.settings = {
      data-root = "/home/rph/boxship";
    };

  users.users.rph.extraGroups = [ "docker" ];

}
