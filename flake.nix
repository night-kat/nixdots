{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";
    niri.url = "github:sodiboo/niri-flake";
    # Optional, if you intend to follow nvf's obsidian-nvim input
    # you must also add it as a flake input.
    # obsidian-nvim.url = "github:epwalsh/obsidian.nvim";

    # Required, nvf works best and only directly supports flakes
    nvf = {
      url = "github:NotAShelf/nvf";
      # You can override the input nixpkgs to follow your system's
      # instance of nixpkgs. This is safe to do as nvf does not depend
      # on a binary cache.
      # inputs.nixpkgs.follows = "nixpkgs";
      # Optionally, you can also override individual plugins
      # for example:
      # inputs.obsidian-nvim.follows = "obsidian-nvim"; # <- this will use the obsidian-nvim from your inputs
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nvf,
    niri,
    ...
  } @ inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          nvf.nixosModules.default
          home-manager.nixosModules.home-manager
          ./hosts/desktop/configuration.nix
          ./nixosModules
          {
            home-manager.users.nightcat = ./hosts/desktop/home-manager/home.nix;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
          {
            home-manager.extraSpecialArgs = {inherit inputs niri;};
          }
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          nvf.nixosModules.default
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
            home-manager.extraSpecialArgs = {inherit inputs niri;};
          }
        ];
      };
      homeManagerModules.default = ./homeManagerModules;
    };
  };
}
