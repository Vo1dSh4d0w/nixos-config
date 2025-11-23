{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?rev=35cf4ede045d04fdd51a44b606a71104f305c9c0";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    chaotic-nyx.url = "github:chaotic-cx/nyx/main";
    chaotic-nyx.inputs.home-manager.follows = "home-manager";

    garuda.url = "gitlab:garuda-linux/garuda-nix-subsystem/stable";
    garuda.inputs.nixpkgs.follows = "nixpkgs";
    garuda.inputs.chaotic-nyx.follows = "chaotic-nyx";

    nix-colors.url = "github:misterio77/nix-colors";

    nixvim.url = "github:nix-community/nixvim";

    hyprland.url = "github:hyprwm/Hyprland";

    vo1ded-panel.url = "github:FilipTLW/vo1ded-panel/next";
    # vo1ded-panel.inputs.nixpkgs.follows = "nixpkgs";

    vimix-cursors.url = "path:/home/filip/git/nixos-config/subflakes/vimix-cursors";

    #lixnix = {
    #  url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
    #  flake = false;
    #};

    #lix = {
    #  url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #  inputs.lix.follows = "lixnix";
    #};

    nixcord.url = "github:kaylorben/nixcord";
  };

  outputs =
    {
      self,
      nixpkgs,
      garuda,
      #lix,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      prefix = "vo1d";
      mkVo1dSystem = module: garuda.lib.garudaSystem {
        specialArgs = {
          inherit inputs outputs prefix;
        };
        modules = [
          #lix.nixosModules.default
          module
          ./modules/nixos
        ];
      };
    in
    {
      nixosConfigurations = {
        filipnixos = mkVo1dSystem ./hosts/filipnixos;
      };

      nixConfig = {
        access_tokens = {
          "github.com" = builtins.readFile "/home/filip/.secrets/nix-github-token";
        };
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    };
}
