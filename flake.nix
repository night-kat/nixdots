{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
          home-manager.nixosModules.home-manager
          ./hosts/laptop/configuration.nix
          ./nixosModules
          {
             home-manager.users.nightcat = ./hosts/laptop/home-manager/home.nix;
             home-manager.useGlobalPkgs = true;
             home-manager.useUserPackages = true;
      
          }
          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
          {
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
      homeManagerModules.default = ./homeManagerModules;
    };
  };
}
