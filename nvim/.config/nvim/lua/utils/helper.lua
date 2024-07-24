local previewers = require("telescope.previewers")
local actions = require("telescope.actions")
local Job = require("plenary.job")

local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end,
  }):sync()
end

local mappings = {
  i = {
    ["<C-s>"] = actions.select_horizontal, -- remap c-x
    ["<C-x>"] = actions.delete_buffer,
    ["<M-e>"] = actions.close,
    ["<C-h>"] = "which_key",
    ["<C-p>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.move_selection_next,
    ["<Tab>"] = actions.add_selection,
    ["<S-Tab>"] = actions.remove_selection,
    ["<C-e>"] = actions.drop_all,
    ["<C-q>"] = actions.send_selected_to_qflist,
    ["<C-a>"] = actions.add_selected_to_qflist,
    ["<C-l>"] = actions.send_selected_to_loclist,
    ["<C-m>"] = actions.add_selected_to_loclist,
    ["<M-q>"] = actions.send_to_qflist,
    ["<M-a>"] = actions.add_to_qflist,
    ["<M-l>"] = actions.send_to_loclist,
    ["<M-m>"] = actions.add_to_loclist,
    ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
    -- ["<C-o>"] = actions.nop,
    -- ["<C-t>"] = open_trouble,
  },
  n = {
    -- ["<C-o>"] = actions.nop,
    ["<M-e>"] = actions.close,
    ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
    ["<Tab>"] = actions.add_selection,
    ["<S-Tab>"] = actions.remove_selection,
    ["<C-s>"] = actions.select_horizontal, -- remap c-x
    ["e"] = actions.drop_all,
    ["x"] = actions.delete_buffer,
    ["q"] = actions.send_selected_to_qflist,
    ["a"] = actions.add_selected_to_qflist,
    ["l"] = actions.send_selected_to_loclist,
    ["m"] = actions.add_selected_to_loclist,
    ["Q"] = actions.send_to_qflist,
    ["A"] = actions.add_to_qflist,
    ["L"] = actions.send_to_loclist,
    ["M"] = actions.add_to_loclist,
    -- ["t"] = open_trouble,
  },
}

local buffer = {
  i = {
    ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
  },
  n = {
    ["d"] = actions.delete_buffer + actions.move_to_top,
  },
}

M = {
  new_maker = new_maker,
  mappings = mappings,
  buffer = buffer,
}

return M
