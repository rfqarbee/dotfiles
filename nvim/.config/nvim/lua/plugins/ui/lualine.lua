local utils = require("utils.helper")

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "auto",
      globalstatus = true,
      section_separators = " ",
      component_separators = " ",
      disabled_filetypes = {
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
            local hasloclist = utils.loclist_item()
            return "loc: " .. hasloclist
          end,

          cond = function()
            local hasloclist = utils.loclist_item()
            if hasloclist then
              return true
            end
          end,
        },
        {
          function()
            local hasqfix = utils.qfix_item()
            return "qfix: " .. hasqfix
          end,
          cond = function()
            local hasqfix = utils.qfix_item()
            if hasqfix then
              return true
            end
          end,
          -- padding = { left = 20 },
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
          symbols = {
            modified = "",
          },
          -- FIX: no name during telescope/oil
          fmt = function(name, context)
            local buflist = vim.fn.tabpagebuflist(context.tabnr)
            local winnr = vim.fn.tabpagewinnr(context.tabnr)
            local bufnr = buflist[winnr]
            local mod = vim.fn.getbufvar(bufnr, "&mod")
            local filetype = vim.bo.filetype

            if mod == 1 and filetype == "TelescopePrompt" then
              return "Telescope"
            elseif mod == 0 and filetype == "oil" then
              print(name, "name", mod, "mod")
              return "Oil"
            else
              return (mod == 1 and "[+] " or "") .. name
            end
          end,
        },
      },
    },
  },
}
