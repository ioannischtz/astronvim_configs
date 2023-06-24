-- local path = require("user.utils.utils").path
--
-- local function get_pipenv_dir() return vim.fn.trim(vim.fn.system "pipenv --venv") end
--
local function get_poetry_dir() return vim.fn.trim(vim.fn.system "poetry env info -p") end
--
-- local function get_pdm_package() return vim.fn.trim(vim.fn.system "pdm info --packages") end
--
-- local function get_python_dir(workspace)
--   local poetry_match = vim.fn.glob(path.join(workspace, "poetry.lock"))
--   if poetry_match ~= "" then return get_poetry_dir() end
--
--   local pipenv_match = vim.fn.glob(path.join(workspace, "Pipfile.lock"))
--   if pipenv_match ~= "" then return get_pipenv_dir() end
--
--   -- Find and use virtualenv in workspace directory.
--   for _, pattern in ipairs { "*", ".*" } do
--     local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
--     if match ~= "" then return path.dirname(match) end
--   end
--
--   return ""
-- end
--
-- local _virtual_env = ""
-- local _package = ""
-- local is_windows = false
--
-- local function py_bin_dir()
--   if is_windows then
--     return path.join(_virtual_env, "Scripts;")
--   else
--     return path.join(_virtual_env, "bin:")
--   end
-- end

return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  -- colorscheme = "astrodark",
  -- colorscheme = "monokai-pro",
  -- colorscheme = "dracula",
  -- colorscheme = "oxocarbon",
  -- colorscheme = "omni",
  colorscheme = "melange",
  -- colorscheme = "github-colors",
  -- colorscheme = "rasmus",
  -- colorscheme = "minimal",
  -- colorscheme = "nvimgelion",
  -- colorscheme = "onenord",
  -- colorscheme = "falcon",
  -- colorscheme = "mellow",
  -- colorscheme = "github_dark",
  -- colorscheme = "catppuccin-macchiato",
  -- colorscheme = "kanagawa-wave",
  -- colorscheme = "kanagawa-dragon",
  -- colorscheme = "kanagawa-lotus",
  -- colorscheme = "tokyonight",
  -- colorscheme = "nord",
  -- colorscheme = "zenburned",
  -- colorscheme = "seoulbones",
  -- colorscheme = "mellifluous",
  -- colorscheme = "oh-lucy",
  -- colorscheme = "aquarium",
  -- colorscheme = "tokyobones",
  -- colorscheme = "duckbones",
  -- colorscheme = "rosebones",
  -- colorscheme = "rose-pine",
  -- colorscheme = "rose-pine-moon",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
          "html",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
      -- "prettierd",
    },
    config = {
      lua_ls = {
        settings = {
          Lua = {
            hint = { enable = true, arrayIndex = "Disable" },
          },
        },
      },
      -- prettierd = {
      --   printwidth = 80,
      -- },
      tsserver = {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
            hint = { enable = true },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
            hint = { enable = true },
          },
        },
      },
      -- rust_analyzer = {
      --   settings = {
      --     ["rust-analyzer"] = {
      --       cargo = {
      --         loadOutDirsFromCheck = true,
      --         features = "all",
      --       },
      --       checkOnSave = {
      --         command = "clippy",
      --       },
      --       procMacro = {
      --         enable = true,
      --       },
      --       experimental = {
      --         procAttrMacros = true,
      --       },
      --     },
      --   },
      -- },
    },

    setup_handlers = {
      -- pyright = function()
      --   require("lspconfig").pyright.setup {
      --     on_init = function(client)
      --       client.config.settings.python.pythonPath = "/usr/bin/python3"
      --       client.config.settings.venvPath = get_poetry_dir()
      --       client.config.settings.venv = vim.fn.substitute(get_poetry_dir(), "^.*/", "", "")
      --     end,
      --   }
      -- end,
      -- ruff_lsp = function()
      --   require("lspconfig")["ruff_lsp"].setup {
      --     on_attach = function(client, bufnr) client.server_capabilities.hoverProvider = false end,
      --     before_init = function(client) client.config.interpreter = get_poetry_dir() end,
      --     on_init = function(client) client.config.interpreter = get_poetry_dir() end,
      --   }
      -- end,
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    vim.filetype.add {
      extension = {
        mdx = "markdown.mdx",
      },
      filename = {},
      pattern = {},
    }
  end,
}
