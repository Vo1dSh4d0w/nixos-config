{
pkgs,
lib,
config,
...
}:
{
  options.zeditor-module = {
    enable = lib.mkEnableOption "Enable zed editor module";
  };

  config = lib.mkIf config.zeditor-module.enable {
    programs.zed-editor = {
      enable = true;

      extensions = [ "nix" "make" "angular" "scss" "toml" "html" "angular" ];

      userSettings = {
        hour_format = "hour24";
        auto_update = false;
        base_keymap = "JetBrains";
        terminal = {
          detect_venv = {
            on = {
                directories = [".env" "env" ".venv" "venv"];
                activate_script = "default";
            };
          };
          font_family = "JetBrainsMonoNF-Regular";
          working_directory = "current_project_directory";
        };

        agent = {
          enabled = false;
        };

        lsp = {
          clangd = {
            binary = {
              path = "${pkgs.clang-tools}/bin/clangd";
            };
          };
        };

        vim_mode = true;
        load_direnv = "shell_hook";
        theme = {
          mode = "dark";
          light = "One Light";
          dark = "Tokyo Night";
        };
      };
    };
  };
}
