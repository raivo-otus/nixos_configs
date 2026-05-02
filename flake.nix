{
  description = "NixOS configuration flake for Grenth and lyssa";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";
    nvf.url = "github:notashelf/nvf";
    hermes-agent.url = "github:NousResearch/hermes-agent";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = {
    self,
    nixpkgs,
    nix-cachyos-kernel,
    nvf,
    hermes-agent,
    sops-nix,
    ...
  } @ inputs: let
    systems = ["x86_64-linux" "aarch64-darwin"];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        my-neovim =
          (nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = [
              ./modules/nvf-module.nix
            ];
          }).neovim;
      }
    );

    nixosConfigurations.Grenth = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        hermes-agent.nixosModules.default
        sops-nix.nixosModules.sops
        ./hosts/Grenth/configuration.nix
        (
          {pkgs, ...}: {
            nixpkgs.overlays = [nix-cachyos-kernel.overlays.default];
            boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto;

            environment.systemPackages = [
              self.packages.${pkgs.stdenv.hostPlatform.system}.my-neovim
            ];
          }
        )
      ];
    };

    nixosConfigurations.lyssa = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        sops-nix.nixosModules.sops
        ./hosts/lyssa/configuration.nix
        (
          {pkgs, ...}: {
            environment.systemPackages = [
              self.packages.${pkgs.stdenv.hostPlatform.system}.my-neovim
            ];
          }
        )
      ];
    };
  };
}
