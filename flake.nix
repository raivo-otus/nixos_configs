{
  description = "Configuration flake for Desktop-Grenth";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    nix-cachyos-kernel,
    nvf,
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
        ./configuration.nix
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
  };
}
