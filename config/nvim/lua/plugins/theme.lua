return {
  {
    "RRethy/nvim-base16",
    lazy = false,
    priority = 1000,
    config = function()
      require("base16-colorscheme")
    end,
  },
  -- LazyVim applies this colorscheme on startup
  { "LazyVim/LazyVim", opts = { colorscheme = "base16-rose-pine-dawn" } },
}
