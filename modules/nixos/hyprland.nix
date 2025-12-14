{config, lib, pkgs, inputs, prefix, ...}:
let
  cfg = config.${prefix}.hyprland;
in
{
  options.${prefix}.hyprland = {
    enable = lib.mkEnableOption "enable hyprland defaults";
    gdm.enable = lib.mkEnableOption "enable gdm";
    sddm.enable = lib.mkEnableOption "enable sddm";
  };

  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;
      xkb.layout = "de";
    };

    services.displayManager.gdm = lib.mkIf cfg.gdm.enable {
      enable = true;
      wayland = true;
    };

    services.displayManager.sddm = lib.mkIf cfg.sddm.enable {
      enable = true;
      wayland.enable = true;
    };

    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
      withUWSM = true;
    };

    security.pam.services.gdm.enableGnomeKeyring = true;
  };
}
