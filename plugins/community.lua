return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- COLORSCHEME
  { import = "astrocommunity.colorscheme.monokai-pro-nvim" },
  { import = "astrocommunity.colorscheme.mellow-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.dracula-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.nord-nvim" },
  { import = "astrocommunity.colorscheme.github-nvim-theme" },
  { import = "astrocommunity.colorscheme.oxocarbon-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.vscode-nvim" },
  { import = "astrocommunity.colorscheme.rose-pine" },

  -- PACK
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.tailwindcss" },

  -- EDITING-SUPPORT
  { import = "astrocommunity.editing-support.nvim-ts-rainbow2" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },

  -- MARKDOWN-AND-LATEX
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },

  -- MOTION
  { import = "astrocommunity.motion.vim-matchup" },

  -- UTILITY
  { import = "astrocommunity.utility.transparent-nvim" },
  { import = "astrocommunity.utility.neodim" },
}
