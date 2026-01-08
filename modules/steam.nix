{ pkgs, ... }:

{

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = with pkgs; [
    mangohud
    protonup-ng
    protontricks
    bottles
  ];

  programs.gamemode.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "/home/rph/.steam/root/compatibilitytools.d";
  };
  
  # TurtleWoW
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

}
