{config, lib, pkgs, prefix, ...}:
let
  cfg = config.${prefix}.bluetooth;
in
{
  options.${prefix}.bluetooth = {
    enable = lib.mkEnableOption "enable bluetooth defaults";
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth.enable = true;

    services.blueman.enable = true;
  };
}
