{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "z"
        "extract"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    ghostty
    tmux
    starship
  ];

  environment.variables = {
    TERMINAL = "ghostty";
    EDITOR = "nvim";
  };
}
