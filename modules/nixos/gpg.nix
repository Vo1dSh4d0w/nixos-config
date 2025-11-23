{config, lib, pkgs, prefix, ...}:
let
  cfg = config.${prefix}.gpg;
in
{
  options.${prefix}.gpg = {
    enable = lib.mkEnableOption "enable gpg defaults";
  };

  config = lib.mkIf cfg.enable {
    programs.gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
    };

    services.pcscd.enable = true;
  };
}
