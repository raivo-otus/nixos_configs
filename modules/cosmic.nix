{ pkgs, ... }:

{
	services.displayManager.cosmic-greeter.enable = true;
	services.desktopManager.cosmic.enable = true;
	services.desktopManager.cosmic.xwayland.enable = true;

	services.displayManager.autoLogin = {
		enable = true;
		user = "rph";
		};
}
