{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # For dev shells
    git
    gh
    lazygit
    # For neovim
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

  programs.bash.interactiveShellInit = ''
    eval "$(direnv hook bash)"
  '';
}
