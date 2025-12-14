{
  pkgs,
  lib,
  config,
  prefix,
  ...
}:
let
  cfg = config.${prefix}.zeditor;
in
{
  options.${prefix}.zeditor = {
    enable = lib.mkEnableOption "Enable zed editor module";
  };

  config = lib.mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;

      extensions = [ "nix" "make" "angular" "scss" "toml" "html" "angular" ];

      extraPackages = with pkgs; [
        cargo
        rust-analyzer
        rustc
        rustfmt
        rustup

        gcc
      ];

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

          rust-analyzer = {
            binary = {
              path = "${pkgs.rust-analyzer}/bin/rust-analyzer";
            };
            settings = {
              diagnostics = {
                enable = true;
                styleLints = {
                  enable = true;
                };
              };
              check = {
                command = "clippy";
                features = "all";
              };
              cargo = {
                buildScripts = {
                  enable = true;
                };
                features = "all";
              };
              inlayHints = {
                bindingModeHints = {
                  enable = true;
                };
                closureStyle = "rust_analyzer";
                closureReturnTypeHints = {
                  enable = "always";
                };
                discriminantHints = {
                  enable = "always";
                };
                expressionAdjustmentHints = {
                  enable = "always";
                };
                implicitDrops = {
                  enable = true;
                };
                lifetimeElisionHints = {
                  enable = "always";
                };
                rangeExclusiveHints = {
                  enable = true;
                };
              };
              procMacro = {
                enable = true;
              };
              rustc = {
                source = "discover";
              };
              files = {
                excludeDirs = [
                  ".cargo"
                  ".direnv"
                  ".git"
                  "node_modules"
                  "target"
                ];
              };
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

      userKeymaps = [
        {
          context = "Editor && (vim_mode == normal)";
          bindings = {
            "space s" = "workspace::Save";
          };
        }
      ];
    };
  };
}
