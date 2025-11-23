{
  config,
  lib,
  pkgs,
  inputs,
  prefix,
  ...
}:
{
  imports = [
    ./env.nix
    ./hardware-configuration.nix
    ./pkgs.nix
    ./udev.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  nixpkgs = {
    overlays = [(final: prev: {
      vo1ded-panel = inputs.vo1ded-panel.packages.x86_64-linux.default;
      vimix-cursors = inputs.vimix-cursors.packages.x86_64-linux.vimix-cursors;
    })];

    config = {
      allowUnfree = true;

      permittedInsecurePackages = [
        "dotnet-sdk-6.0.428"
        "dotnet-runtime-6.0.36"
      ];
    };
  };

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    keyMap = lib.mkForce "de";
    useXkbConfig = true;
  };

  ${prefix} = {
    containers = {
      mariadb.enable = true;
    };

    users = {
      filip.enable = true;
    };

    bluetooth.enable = true;
    gpg.enable = true;

    graphics = {
      enable = true;
      mesa.enable = true;
    };

    hyprland = {
      enable = true;
      gdm.enable = true;
    };

    pipewire.enable = true;
  };

  programs = {
    nix-ld.enable = true;
    streamcontroller.enable = true;
    virt-manager.enable = true;
  };

  services = {
    gvfs.enable = true;
    mullvad-vpn.enable = true;
  };

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
    waydroid.enable = true;
  };

  garuda = {
    networking.iwd = false;

    performance-tweaks = {
      enable = true;
      cachyos-kernel = true;
    };
  };

  networking = {
    hostName = "filipnixos";

    networkmanager.enable = true;
  };

  system.stateVersion = "24.05";
}
