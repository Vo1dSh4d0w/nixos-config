{
pkgs,
lib,
config,
...
}:
{
  options.rofi-module = {
    enable = lib.mkEnableOption "Enable rofi module";
  };

  config = lib.mkIf config.rofi-module.enable {
    home.packages = with pkgs; [
      rofi
    ];

    home.file.".config/rofi/themes/vo1ded.rasi".text = ''
    /******************************************************************************
     * ROFI Color theme
     * User: FilipTLW
     * Copyright: Filip Myslinski
     ******************************************************************************/
    * {
        font-family:                 "JetBrainsMono Nerd Font";
        red:                         rgba ( 220, 50, 47, 66 % );
        selected-active-foreground:  var(background);
        lightfg:                     #8c6ce6aa;
        separatorcolor:              var(foreground);
        urgent-foreground:           var(red);
        alternate-urgent-background: var(lightbg);
        lightbg:                     #392173aa;
        spacing:                     2;
        border-color:                var(foreground);
        normal-background:           var(background);
        background-color:            rgba ( 0, 0, 0, 0 % );
        alternate-active-background: var(lightbg);
        active-foreground:           var(blue);
        blue:                        rgba ( 38, 139, 21, 66 % );
        urgent-background:           var(background);
        alternate-normal-foreground: var(foreground);
        selected-active-background:  var(blue);
        background:                  #291d44aa;
        selected-normal-foreground:  var(lightbg);
        active-background:           var(background);
        alternate-active-foreground: var(blue);
        alternate-normal-background: var(lightbg);
        foreground:                  #c6bcf6aa;
        selected-urgent-background:  var(red);
        selected-urgent-foreground:  var(background);
        normal-foreground:           var(foreground);
        alternate-urgent-foreground: var(red);
        selected-normal-background:  var(lightfg);
    }
    element {
        padding: 1px ;
        spacing: 5px ;
        border:  0;
        cursor:  pointer;
    }
    element normal.normal {
        background-color: var(normal-background);
        text-color:       var(normal-foreground);
    }
    element normal.urgent {
        background-color: var(urgent-background);
        text-color:       var(urgent-foreground);
    }
    element normal.active {
        background-color: var(active-background);
        text-color:       var(active-foreground);
    }
    element selected.normal {
        background-color: var(selected-normal-background);
        text-color:       var(selected-normal-foreground);
    }
    element selected.urgent {
        background-color: var(selected-urgent-background);
        text-color:       var(selected-urgent-foreground);
    }
    element selected.active {
        background-color: var(selected-active-background);
        text-color:       var(selected-active-foreground);
    }
    element alternate.normal {
        background-color: var(alternate-normal-background);
        text-color:       var(alternate-normal-foreground);
    }
    element alternate.urgent {
        background-color: var(alternate-urgent-background);
        text-color:       var(alternate-urgent-foreground);
    }
    element alternate.active {
        background-color: var(alternate-active-background);
        text-color:       var(alternate-active-foreground);
    }
    element-text {
        background-color: rgba ( 0, 0, 0, 0 % );
        text-color:       inherit;
        highlight:        inherit;
        cursor:           inherit;
    }
    element-icon {
        background-color: rgba ( 0, 0, 0, 0 % );
        size:             1.0000em ;
        text-color:       inherit;
        cursor:           inherit;
    }
    window {
        padding:          5;
        background-color: var(background);
        border:           1;
        border-radius:    0;
        transparency:     "real";
    }
    mainbox {
        padding: 0;
        border:  0;
    }
    message {
        padding:      1px ;
        border-color: var(separatorcolor);
        border:       2px dash 0px 0px ;
    }
    textbox {
        text-color: var(foreground);
    }
    listview {
        padding:      2px 0px 0px ;
        scrollbar:    true;
        border-color: var(separatorcolor);
        spacing:      2px ;
        fixed-height: 0;
        border:       2px dash 0px 0px ;
    }
    scrollbar {
        width:        4px ;
        padding:      0;
        handle-width: 8px ;
        border:       0;
        handle-color: var(normal-foreground);
    }
    sidebar {
        border-color: var(separatorcolor);
        border:       2px dash 0px 0px ;
    }
    button {
        spacing:    0;
        text-color: var(normal-foreground);
        cursor:     pointer;
    }
    button selected {
        background-color: var(selected-normal-background);
        text-color:       var(selected-normal-foreground);
    }

    num-filtered-rows, num-rows {
        text-color: grey;
        expand:     false;
    }
    textbox-num-sep {
        text-color: grey;
        expand:     false;
        str:        "/";
    }
    inputbar {
        padding:    1px ;
        spacing:    0px ;
        text-color: var(normal-foreground);
        children:   [ prompt,textbox-prompt-colon,entry, num-filtered-rows, textbox-num-sep, num-rows, case-indicator ];
    }
    case-indicator {
        spacing:    0;
        text-color: var(normal-foreground);
    }
    entry {
        spacing:           0;
        text-color:        var(normal-foreground);
        placeholder-color: grey;
        placeholder:       "Type to filter";
        cursor:            text;
    }
    prompt {
        spacing:    0;
        text-color: var(normal-foreground);
    }
    textbox-prompt-colon {
        margin:     0px 0.3000em 0.0000em 0.0000em ;
        expand:     false;
        str:        ":";
        text-color: inherit;
    }
    '';

    home.file.".config/rofi/themes/test_theme.rasi".text = ''
      /* ROUNDED THEME FOR ROFI */
      /* Author: Newman Sanchez (https://github.com/newmanls) */

      * {
          bg0:    #212121F2;
          bg1:    #2A2A2A;
          bg2:    #3D3D3D80;
          bg3:    #AB47BCF2;
          fg0:    #E6E6E6;
          fg1:    #FFFFFF;
          fg2:    #969696;
          fg3:    #3D3D3D;
      }

      @import "template/rounded-template.rasi"
    '';

    home.file.".config/rofi/template/rounded-template.rasi".text = ''
      /* ROUNDED THEME FOR ROFI */
      /* Author: Newman Sanchez (https://github.com/newmanls) */

      * {
          font:   "Roboto 12";

          background-color:   transparent;
          text-color:         @fg0;

          margin:     0px;
          padding:    0px;
          spacing:    0px;
      }

      window {
          location:       north;
          y-offset:       calc(50% - 176px);
          width:          480;
          border-radius:  24px;

          background-color:   @bg0;
      }

      mainbox {
          padding:    12px;
      }

      inputbar {
          background-color:   @bg1;
          border-color:       @bg3;

          border:         2px;
          border-radius:  16px;

          padding:    8px 16px;
          spacing:    8px;
          children:   [ prompt, entry ];
      }

      prompt {
          text-color: @fg2;
      }

      entry {
          placeholder:        "Search";
          placeholder-color:  @fg3;
      }

      message {
          margin:             12px 0 0;
          border-radius:      16px;
          border-color:       @bg2;
          background-color:   @bg2;
      }

      textbox {
          padding:    8px 24px;
      }

      listview {
          background-color:   transparent;

          margin:     12px 0 0;
          lines:      8;
          columns:    1;

          fixed-height: false;
      }

      element {
          padding:        8px 16px;
          spacing:        8px;
          border-radius:  16px;
      }

      element normal active {
          text-color: @bg3;
      }

      element alternate active {
          text-color: @bg3;
      }

      element selected normal, element selected active {
          background-color:   @bg3;
      }

      element-icon {
          size:           1em;
          vertical-align: 0.5;
      }

      element-text {
          text-color: inherit;
      }
    '';

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
