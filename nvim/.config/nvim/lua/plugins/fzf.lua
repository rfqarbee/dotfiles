return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    local map = require("utils.mapkey")
    local helper = require("helper.config_fzf")

    fzf.setup({
      fzf_colors = true,
      grep = helper.grep_opts,
      keymap = {
        fzf = {
          false, -- do not inherit from defaults
          ["ctrl-c"] = "abort",
          ["ctrl-d"] = "half-page-down",
          ["ctrl-u"] = "half-page-up",
          ["ctrl-f"] = "toggle",
          ["alt-p"] = "toggle-preview",
          ["ctrl-j"] = "preview-page-down",
          ["ctrl-k"] = "preview-page-up",
        },
      },
      actions = {
        files = helper.files,
      },
      files = {
        cwd_prompt = false,
        prompt = "Files > ",
      },
      winopts = {
        border = "single",
        preview = {
          default = "bat",
        },
      },
    })

    -- files
    map("n", "<leader>pf", fzf.files, { desc = "Project file" })
    map("n", "<leader>po", fzf.oldfiles, { desc = "old files" })
    -- git
    map("n", "<leader>pg", fzf.git_files, { desc = "git files" })
    map("n", "<leader>gc", fzf.git_bcommits, { desc = "git buffer comit" })
    -- qf
    map("n", "<leader>pq", fzf.quickfix_stack, { desc = "qf stack" })
    map("n", "<leader>pl", fzf.loclist_stack, { desc = "loclist stack" })
    -- grep
    map("n", "<leader>p`", function()
      vim.ui.input({ prompt = "Grep > " }, function(search)
        if search ~= nil then
          fzf.grep({ search = search, no_esc = true })
        end
      end)
    end, { desc = "Grep" })
    map("n", "<leader>pW", fzf.grep_cWORD, { desc = "grep cWORD" })
    map("n", "<leader>pw", fzf.grep_cword, { desc = "grep cword" })
    map("v", "<leader>`", fzf.grep_visual, { desc = "Grep visual" })
    map("n", "<leader>`", function()
      fzf.live_grep({ resume = true })
    end, { desc = "Project live grep" })
    map("n", "<leader>/", fzf.grep_curbuf, { desc = "Fuzzy find current buffer" })
    -- misc
    map("n", "<leader>pb", fzf.builtin, { desc = "resume last " })
    map("n", "<leader>pr", fzf.resume, { desc = "resume last " })
    map("n", "<leader>bb", fzf.buffers, { desc = "Fuzzy find current buffer" })
    map("n", "<leader>ph", fzf.helptags, { desc = "Project file" })
  end,
}
