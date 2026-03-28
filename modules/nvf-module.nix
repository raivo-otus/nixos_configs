{pkgs, ...}: {
  vim = {
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };

    globals.mapleader = " ";

    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    filetree.neo-tree.enable = true;
    binds.whichKey.enable = true;
    git.gitsigns.enable = true;
    visuals.indent-blankline.enable = true;
    dashboard.dashboard-nvim.enable = true;
    autopairs.nvim-autopairs.enable = true;

    languages = {
      enableTreesitter = true;
      enableFormat = true;

      nix.enable = true;
      markdown.enable = true;
      r.enable = true;
      julia.enable = true;
      lua.enable = true;
      yaml.enable = true;
      toml.enable = true;
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      lspsage.enable = true;
    };
  };
}
