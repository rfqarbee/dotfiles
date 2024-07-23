return {
  -- oil
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local oil = require("oil")
      local winid = require("oil.util").get_preview_win()

      -- vim.api.nvim_create_autocmd("User", {
      --   pattern = "OilEnter",
      --   callback = vim.schedule_wrap(function(args)
      --     if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
      --       if winid then
      --         vim.api.nvim_win_close(winid, true)
      --         return
      --       end
      --       oil.open_preview()
      --     end
      --   end),
      -- })

      oil.setup({
        columns = {
          "icon",
        },
        view_options = {
          show_hidden = true,
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
        },
        float = {
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
        use_default_keymaps = false,
        delete_to_trash = true, -- in $XDG_DATA_HOME/Trash
        skip_confirm_for_simple_edits = true,
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-w>v"] = "actions.select_vsplit",
          ["<C-w>s"] = "actions.select_split",
          ["<C-w>t"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["q"] = "actions.close",
          ["<space>r"] = "actions.refresh", -- refresh list
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd", -- change project directory
          ["."] = "actions.tcd", -- change current tab directory
          ["gs"] = "actions.change_sort",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
      })

      -- vim.keymap.set("n", "-", function()
      --   if winid then
      --     vim.api.nvim_win_close(winid, true)
      --   end
      --   oil.toggle_float()
      -- end, { desc = "Oil Float" })
      vim.keymap.set("n", "-", function()
        require("oil").toggle_float()
      end, { desc = "Float oil" })
      vim.keymap.set("n", "<leader>-", require("oil").open, { desc = "Oil -> Directory" })
      -- vim.keymap.set("n", "<leader>-", function()
      --   if winid then
      --     vim.api.nvim_win_close(winid, true)
      --   end
      --   oil.open()
      -- end, { desc = "Oil Open" })
    end,
  },
  -- gx plugin
  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1 -- disable netrw gx
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    submodules = false, -- not needed, submodules are required only for tests
    opts = {},
    -- config = function()
    --   -- TODO: customize if want
    --   -- NOTE: you can specify also another config if you want
    --   -- 	require("gx").setup({
    --   -- 		open_browser_app = "os_specific", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
    --   -- 		open_browser_args = { "--background" }, -- specify any arguments, such as --background for macOS' "open".
    --   -- 		handlers = {
    --   -- 			plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
    --   -- 			github = true, -- open github issues
    --   -- 			brewfile = true, -- open Homebrew formulaes and casks
    --   -- 			package_json = true, -- open dependencies from package.json
    --   -- 			search = true, -- search the web/selection on the web if nothing else is found
    --   -- 			go = true, -- open pkg.go.dev from an import statement (uses treesitter)
    --   -- 			jira = { -- custom handler to open Jira tickets (these have higher precedence than builtin handlers)
    --   -- 				name = "jira", -- set name of handler
    --   -- 				handle = function(mode, line, _)
    --   -- 					local ticket = require("gx.helper").find(line, mode, "(%u+-%d+)")
    --   -- 					if ticket and #ticket < 20 then
    --   -- 						return "http://jira.company.com/browse/" .. ticket
    --   -- 					end
    --   -- 				end,
    --   -- 			},
    --   -- 			rust = { -- custom handler to open rust's cargo packages
    --   -- 				name = "rust", -- set name of handler
    --   -- 				filetype = { "toml" }, -- you can also set the required filetype for this handler
    --   -- 				filename = "Cargo.toml", -- or the necessary filename
    --   -- 				handle = function(mode, line, _)
    --   -- 					local crate = require("gx.helper").find(line, mode, "(%w+)%s-=%s")
    --   --
    --   -- 					if crate then
    --   -- 						return "https://crates.io/crates/" .. crate
    --   -- 					end
    --   -- 				end,
    --   -- 			},
    --   -- 		},
    --   -- 		handler_options = {
    --   -- 			search_engine = "google", -- you can select between google, bing, duckduckgo, and ecosia
    --   -- 			search_engine = "https://search.brave.com/search?q=", -- or you can pass in a custom search engine
    --   -- 			select_for_search = false, -- if your cursor is e.g. on a link, the pattern for the link AND for the word will always match. This disables this behaviour for default so that the link is opened without the select option for the word AND link
    --   --
    --   -- 			git_remotes = { "upstream", "origin" }, -- list of git remotes to search for git issue linking, in priority
    --   -- 			git_remotes = function(fname) -- you can also pass in a function
    --   -- 				if fname:match("myproject") then
    --   -- 					return { "mygit" }
    --   -- 				end
    --   -- 				return { "upstream", "origin" }
    --   -- 			end,
    --   --
    --   -- 			git_remote_push = false, -- use the push url for git issue linking,
    --   -- 			git_remote_push = function(fname) -- you can also pass in a function
    --   -- 				return fname:match("myproject")
    --   -- 			end,
    --   -- 		},
    --   -- 	})
    -- end, -- default settings
  },
}
