{pkgs, ...}: {
  users.users.stna = {
    isNormalUser = true;
    description = "stna";
    extraGroups = ["networkmanager" "wheel" "storage" "gamemode" "render"];
    shell = pkgs.zsh;
  };

}
