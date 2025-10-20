{ pkgs, ... }:

{

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    #rocmPackages.clr
    #rocmPackages.rocminfo
    #rocmPackages.rocm-smi
    #ollama-rocm
  ];

  services.xserver.videoDrivers = ["amdgpu"];
  
}
