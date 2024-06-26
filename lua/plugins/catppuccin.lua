return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    no_italic = true,
    color_overrides = {
      -- mocha = {
      --   base = "#11111B",
      --   mantle = "#0c0c13",
      --   crust = "#06060a",
      -- },
      mocha = {
        base = "#181825",
        mantle = "#11111B",
        crust = "#0c0c13",
      },
    },
    integrations = {
      aerial = true,
      alpha = true,
      cmp = true,
      dap = true,
      dap_ui = true,
      gitsigns = true,
      illuminate = true,
      indent_blankline = true,
      markdown = true,
      mason = true,
      native_lsp = true,
      neotree = true,
      notify = true,
      semantic_tokens = true,
      symbols_outline = true,
      telescope = true,
      treesitter = true,
      ts_rainbow = true,
      ufo = true,
      which_key = true,
      window_picker = true,
    },
  },
}
