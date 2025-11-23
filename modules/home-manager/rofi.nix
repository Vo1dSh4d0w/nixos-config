{
  pkgs,
  lib,
  config,
  prefix,
  ...
}:
let
  cfg = config.${prefix}.rofi;
in
{
  options.${prefix}.rofi = {
    enable = lib.mkEnableOption "enable rofi config";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      rofi
    ];

    home.file.".config/rofi/tokyonight.rasi".text = ''
      /*
       * ROFI color theme
       *
       * Based on Something Found in the Internet
       *
       * User: Contributors
       * Copyright: *!
       */

      configuration {
        font: "Cascadia Code 10";

        drun {
          display-name: "";
        }

        run {
          display-name: "";
        }

        window {
          display-name: "";
        }
      }

      * {
        border: 0;
        margin: 0;
        padding: 0;
        spacing: 0;

        bg: #1a1b2640;
        bg-opaque: #1a1b26;
        bg-alt: #232433;
        fg: #6a6f87;
        fg-alt: #a9b1d6;

        background-color: @bg;
        text-color: @fg;
      }

      window {
        transparency: "real";
        width: 700px;
        border-radius: 16px;
        border: 2px;
        border-color: @bg-opaque;
      }

      mainbox {
        children: [inputbar, listview];
      }

      inputbar {
        background-color: #A48CF790;
        text-color: #ffffff;
        children: [prompt, entry];
      }

      entry {
        background-color: inherit;
        text-color: inherit;
        padding: 12px 3px;
      }

      prompt {
        background-color: inherit;
        text-color: inherit;
        padding: 12px;
      }

      listview {
        lines: 8;
      }

      element {
        children: [element-icon, element-text];
      }

      element-icon {
        padding: 10px 10px;
        size: 20px;
      }

      element-text {
        padding: 10px 0;
      }

      element-text selected {
        text-color: @fg-alt;
      }
    '';

    home.file.".config/rofi/config.rasi".text = ''
    configuration {
      modes: [ run ];
    }

    @theme "tokyonight"
    '';
  };
}
