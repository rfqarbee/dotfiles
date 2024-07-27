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

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "auto",
      globalstatus = true,
      section_separators = " ",
      -- section_separators = { left = "", right = "" },
      -- component_separators = { left = "", right = "" }, -- okay with no separator
      component_separators = " ",
      disabled_filetypes = {
        -- tabline = { "TelescopePrompt" },
        statusline = { "oil", "undotree", "dashboard" },
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = {
        {
          -- shamelessly stolen from reddit
          function()
            local loc_values = vim.fn.getloclist(vim.api.nvim_get_current_win())
            local items = count_items(loc_values)
            if items then
              return "Loclist: " .. items
            end
            return "Loclist: 0"
          end,
        },
        {
          function()
            local qf_values = vim.fn.getqflist()
            local items = count_items(qf_values)
            if items then
              return "Qflist: " .. items
            end
            return "Qflist: 0"
          end,
          padding = { left = 20 },
        },
      },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = {
        { "location" },
      },
    },
    extensions = { "fugitive", "trouble", "mason", "lazy" },
    tabline = {
      lualine_a = {
        {
          "tabs",
          tabs_color = {
            inactive = { fg = "#7aa2f7", bg = "#1d202f" },
            active = { fg = "#1f2335", bg = "#7aa2f7" },
          },
          tab_max_length = 40,
          max_legth = vim.o.columns / 3,
          mode = 1,
          path = 0,
          fmt = function(name, context)
            -- Show + if buffer is modified in tab
            -- comment
            local buflist = vim.fn.tabpagebuflist(context.tabnr)
            local winnr = vim.fn.tabpagewinnr(context.tabnr)
            local bufnr = buflist[winnr]
            local mod = vim.fn.getbufvar(bufnr, "&mod")
            local filetype = vim.bo.filetype

            -- TODO: fix this shit
            if filetype == "TelescopePrompt" then
            end

            return name .. (mod == 1 and " +" or "")
          end,
        },
      },
    },
  },
}
