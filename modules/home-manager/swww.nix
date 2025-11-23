{
  lib,
  config,
  prefix,
  ...
}:
let
  cfg = config.${prefix}.swww;
in
{
  options.${prefix}.swww = {
    enable = lib.mkEnableOption "enable swww config";
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/swww/swww-init.sh" = {
      text = ''
        swww-daemon & sleep 0.1 & swww img ${config.home.homeDirectory}/.config/swww/wallpaper.png
      '';
      executable = true;
    };
  };
}
