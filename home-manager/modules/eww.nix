{
lib,
config,
...
}:
{
  options.eww-module = {
    enable = lib.mkEnableOption "enable eww module";
  };

  config = lib.mkIf config.eww-module.enable {
    programs.eww = {
      enable = true;
      enableFishIntegration = true;

      configDir = ./eww-config;
    };
  };
}
