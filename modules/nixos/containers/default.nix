{ lib, config, prefix, ... }:
{
  imports = [
    ./mariadb.nix
  ];

  virtualisation.oci-containers.backend = "docker";
}
