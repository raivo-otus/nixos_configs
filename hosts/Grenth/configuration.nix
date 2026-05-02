{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/amd.nix
    ../../modules/audio.nix
    ../../modules/bluetooth.nix
    ../../modules/boot.nix
    ../../modules/networkmanager.nix
    ../../modules/ollama.nix
    ../../modules/gui-apps.nix
    ../../modules/steam.nix
    ../../modules/cosmic.nix
    ../../modules/zed.nix
    #../../modules/gnome.nix
    ../../services/llama-cpp.nix
    ../../services/open-webui.nix
    ../../services/hermes-agent.nix
    ../../users/rph.nix
    ../../users/stna.nix
  ];

  boot.loader.systemd-boot.memtest86.enable = true;

  networking.hostName = "Grenth";

  services.xserver.enable = true;

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    vim
  ];

  system.stateVersion = "24.05";
}
