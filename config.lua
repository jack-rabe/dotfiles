-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

--[[
lvim is the global options object
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "nightfly"
vim.opt.relativenumber = true
vim.opt.timeoutlen = 200
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

lvim.keys.normal_mode["ga"] = "<C-^>"
lvim.keys.normal_mode["<leader>o"] = "<C-w>o"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["<leader>y"] = ':let @+ = expand("%")<cr>)'
-- Harpoon
lvim.keys.normal_mode["m"] = ":lua require('harpoon.mark').add_file()<cr>"
lvim.keys.normal_mode["''"] = ":lua require('harpoon.ui').toggle_quick_menu()<cr>"
lvim.keys.normal_mode["'n"] = ":lua require('harpoon.ui').nav_next()<cr>"
lvim.keys.normal_mode["'p"] = ":lua require('harpoon.ui').nav_prev()<cr>"
lvim.keys.normal_mode["'a"] = ":lua require('harpoon.ui').nav_file(1)<cr>"
lvim.keys.normal_mode["'s"] = ":lua require('harpoon.ui').nav_file(2)<cr>"
lvim.keys.normal_mode["'d"] = ":lua require('harpoon.ui').nav_file(3)<cr>"
lvim.keys.normal_mode["'f"] = ":lua require('harpoon.ui').nav_file(3)<cr>"

-- Telescope
lvim.lsp.buffer_mappings.normal_mode["gr"] = nil
lvim.keys.normal_mode["gr"] = ":Tel lsp_references<cr>"
lvim.keys.normal_mode["<leader>?"] = ":Tel keymaps<cr>"
lvim.keys.normal_mode["<leader>*"] = ":Tel grep_string<cr>"
lvim.keys.normal_mode["<leader>r"] = ":Tel command_history<cr>"


-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  --   { command = "black", filetypes = { "python" } },
  --   { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "typescript", "typescriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint", filetypes = { "javascript", "typescript", "typescriptreact" } }
  --   { command = "flake8", filetypes = { "python" } },
  --   {
  --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "shellcheck",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--severity", "warning" },
  --   },
  --   {
  --     command = "codespell",
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --     filetypes = { "javascript", "python" },
  --   },
}

-- Additional Plugins
lvim.plugins = {
  {
    'tpope/vim-surround',
    'tpope/vim-repeat',
    -- 'morhetz/gruvbox',
    'bluz71/vim-nightfly-colors',
    'haishanh/night-owl.vim',
    'ggandor/leap.nvim',
    'ThePrimeagen/harpoon',
    -- {
    --   'folke/noice.nvim',
    --   dependencies = {
    --     "MunifTanjim/nui.nvim",
    --     "rcarriga/nvim-notify",
    --   },
    --   config = function()
    --     require('noice').setup({
    --       lsp = {
    --         -- override markdown rendering so that cmp and other plugins use Treesitter
    --         override = {
    --           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --           ["vim.lsp.util.stylize_markdown"] = true,
    --           ["cmp.entry.get_documentation"] = true,
    --         },
    --         hover = { enabled = false },
    --         signature = { enabled = false }
    --       },
    --       -- you can enable a preset for easier configuration
    --       presets = {
    --         bottom_search = true,         -- use a classic bottom cmdline for search
    --         long_message_to_split = true, -- long messages will be sent to a split
    --       },
    --     })
    --   end,

    --   -- "github/copilot.vim",
    --   --   {
    --   --     "leoluz/nvim-dap-go",
    --   --     config = function()
    --   --       require('dap-go').setup()
    --   --     end,
    --   --   },
    -- }
  },
}


require("leap").add_default_mappings()

require("harpoon").setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 50,
  }
})

-- fix cwd changing automatically
lvim.builtin.project.patterns = { ">Projects", ".git" }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--
--
--
-- local dap = require('dap')
-- dap.configurations.elixir = {
--   {
--     type = 'elixir',
--     request = 'launch',
--     name = "Launch file",
--   },
-- }
-- dap.adapters.elixir = {
--   type = "executable",
--   command = '/Users/jrabe/.local/share/lvim/mason/bin/elixir-ls-debugger',
--   args = {}
-- }
