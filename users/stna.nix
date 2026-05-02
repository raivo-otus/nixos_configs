{pkgs, ...}: {
  users.users.stna = {
    isNormalUser = true;
    description = "stna";
    extraGroups = ["networkmanager" "wheel" "storage" "gamemode" "render"];
    shell = pkgs.zsh;
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = ["/home/stna/.steam/root/compatibilitytools.d"];
  };
}
