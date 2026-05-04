{pkgs, ...}: {
  users.users.rph = {
    isNormalUser = true;
    description = "rph";
    extraGroups = ["networkmanager" "wheel" "storage" "gamemode" "render" "video" "docker"];
    shell = pkgs.zsh;
  };

}
