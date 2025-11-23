{ lib, config, pkgs, prefix, ... }:
let
  cfg = config.${prefix}.containers.mariadb;
in
{
  options.${prefix}.containers.mariadb = {
    enable = lib.mkEnableOption "enable mariadb container";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.oci-containers.containers.mariadb = {
      autoStart = true;
      hostname = "mariadb";
      image = "mariadb";
      environment = {
        MARIADB_ROOT_PASSWORD = "1234";
      };
      ports = [
        "3306:3306/tcp"
      ];
      volumes = [
        "/home/filip/docker/mariadb/data:/var/lib/mysql"
      ];
    };

  };
}
