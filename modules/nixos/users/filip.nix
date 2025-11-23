{ lib, config, inputs, prefix, ... }:
let
  cfg = config.${prefix}.users.filip;
in
{
  options.${prefix}.users.filip = {
    enable = lib.mkEnableOption "add user 'filip'";
  };

  config = lib.mkIf cfg.enable {
    users.users.filip = {
      isNormalUser = true;
      extraGroups = [ "wheel" "audio" "input" "uinput" "libvirtd" ];
    };

    home-manager.users.filip = import ../../../homes/filip ;
  };
}
