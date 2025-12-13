{ nixpkgs, ... }:
let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
in pkgs.brave.override {
  commandLineArgs = "--ozone-platform=wayland --disable-features=WaylandWpColorManagerV1";
}
