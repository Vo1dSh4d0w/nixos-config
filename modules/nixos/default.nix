{inputs, prefix, ...}: {
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
    inherit inputs prefix;
  };

  garuda.home-manager.modules = [
    ../home-manager
  ];
}
