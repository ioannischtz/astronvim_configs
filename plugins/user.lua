return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
    },
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require("lsp-inlayhints").setup()
      vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
      vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttach_inlayhints",
        callback = function(args)
          if not (args.data and args.data.client_id) then return end

          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          require("lsp-inlayhints").on_attach(client, bufnr)
        end,
      })
    end,
    event = "User AstroFile",
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "Wansmer/treesj",
    keys = {
      {
        "<leader>m",
        "<CMD>TSJToggle<CR>",
        desc = "Toggle Treesitter Join",
      },
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
  },
  {
    "junegunn/vim-easy-align",
    cmd = { "EasyAlign", "LiveEasyAlign" },
    keys = { "<Plug>(EasyAlign)", "<Plug>(LiveEasyAlign)" },
    auto = "init",
  },
  {
    "ThePrimeagen/harpoon",
    event = "BufRead",
    config = function() require "user.mod.harpoon" end,
  },
  -- {
  --   "folke/persistence.nvim",
  --   event = "BufRead",
  --   config = function() require "user.mod.persistence" end,
  -- },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    auto = "init",
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      -- for DAP support
      "mfussenegger/nvim-dap-python",
    },
    config = true,
    keys = {
      {
        "<leader>vs",
        "<cmd>:VenvSelect<cr>",
        -- optional if you use a autocmd (see #🤖-Automate)
        "<leader>vc",
        "<cmd>:VenvSelectCached<cr>",
      },
    },
    opts = {

      -- auto_refresh (default: false). Will automatically start a new search every time VenvSelect is opened.
      -- When its set to false, you can refresh the search manually by pressing ctrl-r. For most users this
      -- is probably the best default setting since it takes time to search and you usually work within the same
      -- directory structure all the time.
      auto_refresh = false,

      -- search_venv_managers (default: true). Will search for Poetry and Pipenv virtual environments in their
      -- default location. If you dont use the default location, you can
      search_venv_managers = true,

      -- search_workspace (default: true). Your lsp has the concept of "workspaces" (project folders), and
      -- with this setting, the plugin will look in those folders for venvs. If you only use venvs located in
      -- project folders, you can set search = false and search_workspace = true.
      search_workspace = true,

      -- path (optional, default not set). Absolute path on the file system where the plugin will look for venvs.
      -- Only set this if your venvs are far away from the code you are working on for some reason. Otherwise its
      -- probably better to let the VenvSelect search for venvs in parent folders (relative to your code). VenvSelect
      -- searchs for your venvs in parent folders relative to what file is open in the current buffer, so you get
      -- different results when searching depending on what file you are looking at.
      -- path = "/home/username/your_venvs",

      -- search (default: true). Search your computer for virtual environments outside of Poetry and Pipenv.
      -- Used in combination with parents setting to decide how it searches.
      -- You can set this to false to speed up the plugin if your virtual envs are in your workspace, or in Poetry
      -- or Pipenv locations. No need to search if you know where they will be.
      search = true,

      -- dap_enabled (default: false). When true, uses the selected virtual environment with the debugger.
      -- require nvim-dap-python from https://github.com/mfussenegger/nvim-dap-python
      -- require debugpy from https://github.com/microsoft/debugpy
      -- require nvim-dap from https://github.com/mfussenegger/nvim-dap
      dap_enabled = false,

      -- parents (default: 2) - Used when search = true only. How many parent directories the plugin will go up
      -- (relative to where your open file is on the file system when you run VenvSelect). Once the parent directory
      -- is found, the plugin will traverse down into all children directories to look for venvs. The higher
      -- you set this number, the slower the plugin will usually be since there is more to search.
      -- You may want to set this to to 0 if you specify a path in the path setting to avoid searching parent
      -- directories.
      parents = 2,

      -- name (default: venv) - The name of the venv directories to look for.
      name = { "venv", ".venv" }, -- NOTE: You can also use a lua table here for multiple names: {"venv", ".venv"}`

      -- fd_binary_name (default: fd) - The name of the fd binary on your system.
      fd_binary_name = "fd",

      -- notify_user_on_activate (default: true) - Prints a message that the venv has been activated
      notify_user_on_activate = true,
    },
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  },
  -- {
  --   "rafi/neoconf-venom.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   version = false,
  -- },
  {
    "luk400/vim-jukit",
    ft = "ipynb",
    -- cmd = { 'JukitOut', 'JukitOutHist' },
    auto = true,
  },
  -- {
  --   "petobens/poet-v",
  --   opts = {},
  --   keys = { { "<leader>vp", "<cmd>PoetvActivate", desc = "Activate the poetry env" } },
  -- },
  {
    "ThePrimeagen/vim-be-good",
    opts = {},
    keys = {
      { "<leader>vbg", "<cmd>VimBeGood<cr>", desc = "Start the VimBeGood vim tutorial game" },
    },
  },
  {
    "jubnzv/virtual-types.nvim",
    opts = {},
  },
  {
    "mcchrish/zenbones.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
  },
  {
    "frenzyexists/aquarium-vim",
  },
  { "ramojus/mellifluous.nvim" },
  { "Yazeed1s/oh-lucy.nvim" },
  { "yonlu/omni.vim" },
  { "savq/melange-nvim" },
  { "fenetikm/falcon" },
  { "lourenci/github-colors" },
  { "rmehri01/onenord.nvim" },
  { "kvrohit/rasmus.nvim" },
  { "Yazeed1s/minimal.nvim" },
  { "nyngwang/nvimgelion" },
}
