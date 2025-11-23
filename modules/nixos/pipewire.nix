{config, lib, pkgs, prefix, ...}:
let
  cfg = config.${prefix}.pipewire;
in
{
  options.${prefix}.pipewire = {
    enable = lib.mkEnableOption "enable pipewire defaults";
  };

  config = lib.mkIf cfg.enable {
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      wireplumber.enable = true;
    };
  };

}
