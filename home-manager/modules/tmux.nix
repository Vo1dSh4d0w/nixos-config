{ pkgs, lib, config, ... }:
let
  cfg = config.vo1d.tmux;
in
{
  options.vo1d.tmux.enable = lib.mkEnableOption "enable tmux";
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
