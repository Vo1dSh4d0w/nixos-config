{ nixpkgs, ... }: {
  brave = import ./brave.nix { inherit nixpkgs; };
}
