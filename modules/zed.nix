{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.zed-editor
  ];

  programs.nix-ld = {
    enable = true;
  };
}
