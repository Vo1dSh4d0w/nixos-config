{config, lib, pkgs, prefix, ...}:
let
  cfg = config.${prefix}.graphics;
in
{
  options.${prefix}.graphics = {
    enable = lib.mkEnableOption "enable graphics defaults";
    mesa.enable = lib.mkEnableOption "enable mesa";
  };

  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = lib.mkIf cfg.mesa.enable [
        pkgs.mesa
      ];
    };
  };
}
