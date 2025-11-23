{pkgs, lib, ...}: {
  environment = {
    sessionVariables = {
      GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
      GTK_THEME = "Tokyonight-Purple-Dark";
    };

    variables = {
      EDITOR = lib.mkForce "nvim";
      VISUAL = lib.mkForce "nvim";
    };
  };
}
