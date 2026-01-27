{ inputs, ... }: {

  # may look a bit different
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "nightcat" = import ./../hosts/laptop/home-manager/home.nix;
      "nightcat" = {
        imports = [
          ./hosts/laptop/home-manager/home.nix
          inputs.self.outputs.homeManagerModules.default
        ];
      };
    };
  };
}