{pkgs, ...}: {
  users.users.rph = {
    isNormalUser = true;
    description = "rph";
    extraGroups = ["networkmanager" "wheel" "storage" "gamemode"];
    shell = pkgs.zsh;
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = ["/home/rph/.steam/root/compatibilitytools.d"];
  };
}
