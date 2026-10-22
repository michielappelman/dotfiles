return {
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = { "sindrets/diffview.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      disable_hint = true,
      disable_commit_confirmation = true,
      disable_insert_on_commit = true,
      integrations = { diffview = true },
    },
  },
  {
    "ggandor/lightspeed.nvim",
    dependencies = { "tpope/vim-repeat" },
    opts = {
      exit_after_idle_msecs = { labeled = 1000, unlabeled = 2500 },
      match_only_the_start_of_same_char_seqs = true,
      limit_ft_matches = 6,
      substitute_chars = { ["\r"] = "¬" },
    },
  },
  "tpope/vim-surround",
  {
    "plasticboy/vim-markdown",
    dependencies = { "godlygeek/tabular" },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
}
