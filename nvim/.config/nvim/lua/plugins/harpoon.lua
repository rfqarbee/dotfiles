return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Harpoon add list" })
    vim.keymap.set("n", "<space><space>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Add harpoon list" })
    vim.keymap.set("n", "<leader>1", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon list 1" })
    vim.keymap.set("n", "<leader>2", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon list 2" })
    vim.keymap.set("n", "<leader>3", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon list 3" })
    vim.keymap.set("n", "<leader>4", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon list 4" })
    vim.keymap.set("n", "<leader>5", function()
      harpoon:list():select(5)
    end, { desc = "Harpoon list 5" })

    vim.keymap.set("n", "]a", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "[a", function()
      harpoon:list():next()
    end)
    local conf = require("telescope.config").values
    -- local function toggle_telescope(harpoon_files)
    --   local file_paths = {}
    --   for _, item in ipairs(harpoon_files.items) do
    --     table.insert(file_paths, item.value)
    --   end

    --   require("telescope.pickers")
    --     .new({}, {
    --       prompt_title = "Harpoon",
    --       finder = require("telescope.finders").new_table({
    --         results = file_paths,
    --       }),
    --       previewer = conf.file_previewer({}),
    --       sorter = conf.generic_sorter({}),
    --     })
    --     :find()
    -- end

    -- vim.keymap.set("n", "<leader><leader>", function()
    --   toggle_telescope(harpoon:list())
    -- end, { desc = "Open harpoon window" })
  end,
}
