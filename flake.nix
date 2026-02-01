{

  description = "Configuration flake for Desktop-Grenth";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";
  };

  outputs = { self, nixpkgs, nix-cachyos-kernel, ... } @ inputs: {
    nixosConfigurations.Grenth = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
    	(
	  { pkgs, ... }:
	    {
	      nixpkgs.overlays = [nix-cachyos-kernel.overlays.default];
	      boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-rt-bore-lto;
	    }
	)
      ];
    };
  };
}
