{ pkgs, ... }:

{

	virtualisation.docker.enable = true;
	virtualisation.docker.daemon.settings = {
		data-root = "/home/rph/boxship";
	};

	users.users.rph.extraGroups = [ "docker" ];

}
