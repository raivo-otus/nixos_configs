{ pkgs, ... }:

{
	services.displayManager.cosmic-greeter.enable = true;
	services.desktopManager.cosmic.enable = true;

	services.displaymanager.autoLogin = {
		enable = true;
		user = "rph";
		};
}
