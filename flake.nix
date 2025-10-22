{

  description = "Configuration flake for Desktop-Grenth";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = { self, nixpkgs, chaotic, ... } @ inputs: {
    nixosConfigurations.Grenth = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
	chaotic.nixosModules.default
      ];
    };
  };

}
