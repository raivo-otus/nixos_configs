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
  ];

  programs.direnv = {
    enable = true;
    loadInNixShell = true;
  };
}
