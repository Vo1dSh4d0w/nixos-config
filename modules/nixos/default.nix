{inputs, prefix, packageOverrides, ...}: {
  imports = [
    ./containers
    ./users

    ./bluetooth.nix
    ./gpg.nix
    ./graphics.nix
    ./hyprland.nix
    ./pipewire.nix
  ];

  home-manager.extraSpecialArgs = {
    inherit inputs prefix packageOverrides;
  };

  garuda.home-manager.modules = [
    ../home-manager
  ];
}
