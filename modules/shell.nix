{pkgs, ...}: {
  programs.zsh.enable = true;

  environment.variables = {
    TERMINAL = "ghostty";
    EDITOR = "nvim";
  };

  environment.systemPackages = with pkgs; [
    ghostty
    tmux
    starship
  ];
}
