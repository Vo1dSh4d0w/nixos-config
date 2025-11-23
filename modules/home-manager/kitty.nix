{
  pkgs,
  lib,
  config,
  prefix,
  ...
}:
let
  cfg = config.${prefix}.kitty;
in
{
  options.${prefix}.kitty = {
    enable = lib.mkEnableOption "enable kitty config";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      kitty
    ];

    home.file.".config/kitty/kitty.conf".text = ''

    font_family           JetBrainsMono Nerd Font
    bold_font             auto
    italic_font           auto
    bold_italic_font      auto

    background            #000000
    background_opacity    0.5

    window_padding_width  4

    '';
  };
}
