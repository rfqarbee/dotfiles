local M = {}

local previewers = require("telescope.previewers")
local actions = require("telescope.actions")
local Job = require("plenary.job")

M.telescope_new_maker = function(filepath, bufnr, opts)
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

M.telescope_mappings = {
  i = {
    ["<M-e>"] = actions.close,
    ["<C-s>"] = actions.select_horizontal, -- remap c-x
    ["<C-x>"] = actions.delete_buffer,
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
    ["<M-e>"] = actions.close,
    -- ["<C-o>"] = actions.nop,
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

M.telescope_buffer = {
  i = {
    ["<CR>"] = actions.select_default,
    ["<C-d>"] = actions.delete_buffer,
  },
  n = {
    ["<CR>"] = actions.select_default,
    ["<c-d>"] = actions.delete_buffer,
  },
}

local function count_items(qf_list)
  if #qf_list > 0 then
    local valid = 0
    for _, item in ipairs(qf_list) do
      if item.valid == 1 then
        valid = valid + 1
      end
    end
    if valid > 0 then
      return tostring(valid)
    end
  end
end

local function loclist()
  local loc_values = vim.fn.getloclist(vim.api.nvim_get_current_win())
  local items = count_items(loc_values)
  if items then
    return items
  else
    return nil
  end
end

local function qfix()
  local qf_values = vim.fn.getqflist()
  local items = count_items(qf_values)
  if items then
    return items
  else
    return nil
  end
end

M.qfix_item = qfix
M.loclist_item = loclist

return M
