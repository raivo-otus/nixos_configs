{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    gh
    lazygit
    fd
    ripgrep
    fzf
    wget
    curl
    unzip
    sops
    age
    ssh-to-age
  ];

  programs.direnv = {
    enable = true;
    loadInNixShell = true;
  };
}
