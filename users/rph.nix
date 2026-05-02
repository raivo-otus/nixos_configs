{pkgs, ...}: {
  users.users.rph = {
    isNormalUser = true;
    description = "rph";
    extraGroups = ["networkmanager" "wheel" "storage" "gamemode" "render" "docker"];
    shell = pkgs.zsh;
  };

}
