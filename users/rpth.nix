{pkgs, ...}: {
  users.users.rpth = {
    isNormalUser = true;
    description = "Rasmus Hindström";
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.zsh;
  };
}
