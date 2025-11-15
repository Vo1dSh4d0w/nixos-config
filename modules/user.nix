{ lib, config, inputs, ... }:
let
  cfg = config.user;
in
{
  options.user = {
    enable = lib.mkEnableOption "enable user module";

    username = lib.mkOption {
      default = "user";
      description = "username";
    };

    sudoer = lib.mkEnableOption "user is a sudoer";

    useHomeManager = lib.mkEnableOption "use home manager";

    homeManagerConfig = lib.mkOption {
      default = "";
      description = "home-manager config file";
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.username} = {
      isNormalUser = true;
      extraGroups = lib.mkIf cfg.sudoer [ "wheel" "audio" "input" "uinput" "libvirtd" ];
    };

    home-manager.users.${cfg.username} = lib.mkIf cfg.useHomeManager (
      import cfg.homeManagerConfig {
        nix-colors = inputs.nix-colors;
        nixvim = inputs.nixvim;
        nixcord = inputs.nixcord;
        nixpkgs = inputs.nixpkgs;
        nixpkgs-stable = inputs.nixpkgs-stable;
        vimix-cursors = inputs.vimix-cursors;
        ags = inputs.ags;
      }
    );
  };
}
