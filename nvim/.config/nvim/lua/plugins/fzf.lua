return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    local map = require("utils.mapkey")

    fzf.setup({
      fzf_colors = true,
      defaults = {
        header = "what the fuck",
      },
      files = {
        prompt = ">>",
      },
      winopts = {
        border = "single",
        preview = {
          default = "bat",
        },
      },
    })

    map("n", "<leader>pf", function()
      fzf.files()
    end, { desc = "Project file" })
    map("n", "<leader>pg", fzf.live_grep, { desc = "Project live grep" })
    map("n", "<leader>pr", fzf.resume, { desc = "Resume last command " })
    map("n", "<leader>pw", fzf.grep_cWORD, { desc = "Project current word grep" })
    map("n", "<leader>po", fzf.oldfiles, { desc = "Project current word grep" })
    map("n", "<leader>`", fzf.grep_curbuf, { desc = "Fuzzy find current buffer" })
    map("n", "<leader>bb", fzf.buffers, { desc = "Fuzzy find current buffer" })
  end,
}
