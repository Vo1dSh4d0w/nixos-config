{ pkgs, lib, config, prefix, ... }:
let
  cfg = config.${prefix}.tmux;
in
{
  options.${prefix}.tmux.enable = lib.mkEnableOption "enable tmux";

  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      clock24 = true;
      plugins = with pkgs.tmuxPlugins; [
        tokyo-night-tmux
      ];
      keyMode = "vi";
      shell = "${pkgs.fish}/bin/fish";
      shortcut = "a";
    };
  };
}
