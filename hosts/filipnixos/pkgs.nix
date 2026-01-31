{pkgs, lib, ...}:
let
  rider =
  let
    extra-path = with pkgs; [
      dotnetCorePackages.sdk_9_0_3xx
      dotnetPackages.Nuget
      godot_4
      godot_4-export-templates-bin
      mono
      msbuild
    ];
    extra-lib = [ ];
  in
    pkgs.jetbrains.rider.overrideAttrs (attrs: {
      postInstall =
        ''
          # Wrap rider with extra tools and libraries
          mv $out/bin/rider $out/bin/.rider-toolless
          makeWrapper $out/bin/.rider-toolless $out/bin/rider \
            --argv0 rider \
            --prefix PATH : "${lib.makeBinPath extra-path}" \
            --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath extra-lib}"
        ''
        + (attrs.postInstall or "");
    });

  idea =
  let
    extra-path = with pkgs; [
      openjdk25
    ];
    extra-lib = [];
  in
    pkgs.jetbrains.idea.overrideAttrs (attrs: {
      postInstall =
      ''
        mv $out/bin/idea $out/bin/.idea-toolless
        makeWrapper $out/bin/.idea-toolless $out/bin/idea \
          --argv0 idea \
          --prefix PATH : "${lib.makeBinPath extra-path}" \
          --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath extra-lib}"
      ''
      + (attrs.postInstall or "");
    });
in
{
  environment.systemPackages = with pkgs; [
    # utilities
    btop
    direnv
    fish
    gnome-keyring
    gsettings-desktop-schemas
    kalker
    libnotify
    lsof
    pciutils
    smartmontools
    wget
    wine

    # editors and IDEs
    jetbrains.clion
    jetbrains.phpstorm
    jetbrains.pycharm
    jetbrains.rust-rover
    idea
    rider

    # tools
    dbeaver-bin
    gimp
    godot_4-mono
    hyprshot
    kitty
    libreoffice-qt6-still
    maven
    obs-studio
    obsidian
    openjdk25
    protonplus
    protontricks
    qbittorrent
    remmina
    telegram-desktop
    xclicker
    yubikey-manager
    yubikey-personalization
    yubikey-touch-detector

    # gaming and entertainment
    heroic
    prismlauncher
    spotify
    steam
    vlc
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
