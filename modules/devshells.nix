{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # For dev shells
    git
    gh
    direnv
    nix-direnv
    # For neovim
    fd
    ripgrep
    fzf
    wget
    curl
    unzip
  ];

  programs.bash.interactiveShellInit = ''
    eval "$(direnv hook bash)"
  '';
}
