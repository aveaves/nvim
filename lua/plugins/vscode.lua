-- don't do anything in non-vscode instances
if not vim.g.vscode then return {} end

-- a list of known working plugins with vscode-neovim, update with your own plugins
local plugins = {
  "lazy.nvim",
  "AstroNvim",
  "astrocore",
  "astroui",

  "Comment.nvim",
  "nvim-treesitter",
  "nvim-ts-autotag",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",

  "fast-cursor-move.nvim",
  "mini.surround",
  "flash.nvim",
}

local Config = require "lazy.core.config"
-- disable plugin update checking
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
-- replace the default `cond`
Config.options.defaults.cond = function(plugin) return vim.tbl_contains(plugins, plugin.name) end

-- Colors for Flash.nvim in vscode
local mocha_overlay0 = "#6c7086"
local mocha_mantel = "#181825"
local mocha_green = "#a6e3a1"
local mocha_lavander = "#b4befe"
local mocha_peach = "#fab387"

local hls = {
  FlashBackdrop = { fg = mocha_overlay0 },
  FlashLabel = { bg = mocha_mantel, bold = true, fg = mocha_green },
  FlashMatch = { bg = mocha_mantel, fg = mocha_lavander },
  FlashCurrent = { bg = mocha_mantel, fg = mocha_peach },
  FlashCursor = { reverse = true },
}
for hl_group, hl in pairs(hls) do
  hl.default = true
  vim.api.nvim_set_hl(0, hl_group, hl)
end

---@type LazySpec
return {
  -- add a few keybindings
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          -- ["<Leader>ff"] = "<CMD>Find<CR>",
          -- ["<Leader>fw"] = "<CMD>lua require('vscode-neovim').call('workbench.action.findInFiles')<CR>",
          -- ["<Leader>ls"] = "<CMD>lua require('vscode-neovim').call('workbench.action.gotoSymbol')<CR>",
        },
      },
    },
  },
  -- disable colorscheme setting
  { "AstroNvim/astroui", opts = { colorscheme = false } },
  -- disable treesitter highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
}
