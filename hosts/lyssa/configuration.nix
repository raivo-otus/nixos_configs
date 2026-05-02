# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Services
    ../../services/adguard.nix
    ../../services/caddy.nix
    ../../services/arr_stack.nix
    ../../services/teamspeak.nix
    ../../services/tlp.nix
    ../../services/tailscale.nix
    ../../services/ssh.nix
    ../../modules/locale.nix
    ../../modules/shell.nix
    ../../modules/nix-settings.nix
    ../../modules/cli-tools.nix
    ../../modules/devshells.nix
    ../../modules/gnome.nix
    ../../users/rpth.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      intel-compute-runtime
      vpl-gpu-rt
    ];
  };

  environment.sessionVariables = {LIBVA_DRIVER_NAME = "iHD";};

  networking.hostName = "lyssa"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
  ];

  # Keep running
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

  # External HDD mounting
  fileSystems."/srv/Glaurung" = {
    device = "/dev/disk/by-uuid/126860b8-50b0-4f6e-910f-bf17e4f268e0";
    fsType = "ext4";
    options = ["nofail" "defaults"];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
