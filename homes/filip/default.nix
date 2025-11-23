{
  config,
  pkgs,
  lib,
  inputs,
  prefix,
  ...
}:
let
  vo1ded-base16 = {
    base00 = "#291d44";
    base01 = "#392173";
    base02 = "#5a30a7";
    base03 = "#7645d9";
    base04 = "#8c6ce6";
    base05 = "#c6bcf6";
    base06 = "#dfdafa";
    base07 = "#edebfc";
    base08 = "#a959dc";
    base09 = "#fc9586";
    base0A = "#ceb55c";
    base0B = "#90d365";
    base0C = "#66de9b";
    base0D = "#69d0df";
    base0E = "#97b0ff";
    base0F = "#d592ff";
  };
in
{
  imports = [
    inputs.nix-colors.homeManagerModule
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nixcord.homeModules.nixcord
  ];

  home = {
    packages = with pkgs; [
      glib
      dconf
      swww
    ];
  };

  colorScheme = {
    slug = "vo1ded-dark";
    name = "vo1ded-dark";
    variant = "light";
    author = "Filip Myslinski (https://github.com/FilipTLW)";
    palette = vo1ded-base16;
  };


  programs.git = {
    enable = true;
    userName = "Filip Myslinski";
    userEmail = "filipmyslinski2006@gmail.com";
    settings = {
      core.editor = lib.mkForce "nvim";
    };
  };
  programs.micro.enable = lib.mkForce false; # one of the few negatives about GNS

  programs.brave = {
    enable = true;
    extensions = [
      { id = "aicmkgpgakddgnaphhhpliifpcfhicfo"; } # postman interceptor
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }
    ];
  };

  ${prefix} = {
    hyprland.enable = true;
    rofi.enable = true;
    kitty.enable = true;
    starship.enable = true;
    fastfetch.enable = true;
    zeditor.enable = true;
    tmux.enable = true;
    swww.enable = true;
    neovim = {
      enable = true;
      theme = vo1ded-base16;
    };
  };


  systemd.user.startServices = "sd-switch";

  services.gnome-keyring.enable = true;

  home.pointerCursor = {
    enable = true;
    name = "Vimix-cursors";
    package = inputs.vimix-cursors.packages.x86_64-linux.vimix-cursors;
    size = 24;
    gtk.enable = true;
    x11 = {
      enable = true;
    };
  };
  home.sessionVariables = {
    XCURSOR_THEME = "Vimix-cursors";
    XCURSOR_SIZE = "24";
    SDL_JOYSTICK_HIDAPI_PS4 = "0";
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = ":";
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Tokyonight-Purple-Dark";
      package = pkgs.tokyonight-gtk-theme.override {
        themeVariants = [ "purple" ];
      };
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = "1";
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = "1";
    };
  };

  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    config = {
    };
  };

  home.activation.setCursor = config.lib.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.xorg.xrdb}/bin/xrdb -merge ~/.Xresources
  '';

  home.stateVersion = "24.05";
}
