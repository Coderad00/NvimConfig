-- Configuration for telescope.nvim

return {
  -- Plugin information
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",

  -- Dependencies
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },

  -- Configuration function
  config = function()
    -- Require telescope and actions modules
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    -- Set telescope defaults with path truncation and custom keymaps
    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- Move to previous result
            ["<C-j>"] = actions.move_selection_next,   -- Move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- Send to quickfix list and open it
          },
        },
      },
    })

    -- Load fzf extension for fuzzy finding
    telescope.load_extension("fzf")

    -- Set keymaps for fuzzy find features with descriptions
    local keymap = vim.keymap
    keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>gs", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

    -- Load aerial extension for symbol navigation
    require('telescope').load_extension('aerial')

    -- Configure aerial extension to display symbols with proper nesting
    telescope.setup({
    extensions = {
        aerial = {
          show_nesting = {
            ['_'] = false, -- Disable default nesting for all filetypes
            json = true,   -- Enable proper nesting for JSON files
            yaml = true,   -- Enable proper nesting for YAML files
          },
        },
      },
    })
  end,
}










