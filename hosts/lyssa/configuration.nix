{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/boot.nix
    ../../modules/intel.nix
    ../../modules/networkmanager.nix
    ../../services/adguard.nix
    ../../services/caddy.nix
    ../../services/arr_stack.nix
    ../../services/teamspeak.nix
    ../../services/tlp.nix
    ../../users/rpth.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = ["vsyscall=emulate"]; # required by TeamSpeak 6

  networking.hostName = "lyssa";

  services.getty.autologinUser = "rpth";

  environment.systemPackages = with pkgs; [
    vim
  ];

  # Keep running on lid close / power events
  services.logind = {
    lidSwitch = "ignore";
    lidSwitchExternalPower = "ignore";
    lidSwitchDocked = "ignore";
  };
  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };

  virtualisation.docker.enable = true;
  virtualisation.oci-containers.backend = "docker";

  fileSystems."/srv/Glaurung" = {
    device = "/dev/disk/by-uuid/126860b8-50b0-4f6e-910f-bf17e4f268e0";
    fsType = "ext4";
    options = ["nofail" "defaults"];
  };

  system.stateVersion = "25.11";
}
