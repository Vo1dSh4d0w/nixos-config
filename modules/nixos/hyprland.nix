{config, lib, pkgs, inputs, prefix, ...}:
let
  cfg = config.${prefix}.hyprland;
in
{
  options.${prefix}.hyprland = {
    enable = lib.mkEnableOption "enable hyprland defaults";
    gdm.enable = lib.mkEnableOption "enable gdm";
  };

  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;

      displayManager.gdm = lib.mkIf cfg.gdm.enable {
        enable = true;
        wayland = true;
      };

      xkb.layout = "de";
    };

    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };

    security.pam.services.gdm.enableGnomeKeyring = true;
  };
}
