{
  description = "My system config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.moxforever = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          (import "${self}/hardware-configuration.nix")
          (import "${self}/configuration.nix")
        ];
        specialArgs = { inherit inputs; };
      };
    };
}