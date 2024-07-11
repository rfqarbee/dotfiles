local autocmd = vim.api.nvim_create_autocmd
local WhiteSpace = vim.api.nvim_create_augroup("replaceGroup", { clear = true })
local YankGroup = vim.api.nvim_create_augroup("HiglightYank", { clear = true })
local SaveAll = vim.api.nvim_create_augroup("SaveAll", { clear = true })
local TroubleGroup = vim.api.nvim_create_augroup("TroubleGroup", { clear = true })

autocmd("BufWritePost", {
  desc = "Save modified files",
  group = SaveAll,
  pattern = "*",
  callback = function()
    local buflist = {}
    local bufnum = {}
    local buffer = vim.api.nvim_cmd({ cmd = "buffers" }, { output = true })
    local function getstr(fullpath)
      local segments = {}
      for segment in string.gmatch(fullpath, "[^/]+") do
        table.insert(segments, segment)
      end

      if #segments >= 2 then
        return segments[#segments - 1] .. "/" .. segments[#segments]
      elseif #segments == 1 then
        return segments[1]
      else
        return nil
      end
    end
    -- get all line
    for line in buffer:gmatch("[^\r\n]+") do
      table.insert(buflist, line)
    end
    -- only store buffer number
    for _, line in ipairs(buflist) do
      local getNum = line:match("^%s*(%d+)")
      if getNum then
        table.insert(bufnum, getNum)
      end
    end
    -- save for buffers that has changes and notify
    for _, bufnr in ipairs(bufnum) do
      if vim.api.nvim_get_option_value("modified", { buf = tonumber(bufnr) }) then
        local savedFiles = vim.api.nvim_buf_get_name(tonumber(bufnr))
        vim.notify(getstr(savedFiles), vim.log.levels.INFO, {
          title = "File saved!",
          timeout = 4500,
        })
        vim.api.nvim_buf_call(tonumber(bufnr), function()
          vim.cmd("write")
        end)
      end
    end
  end,
})

autocmd("BufWritePre", {
  desc = "Delete trailing whitespace",
  pattern = "*",
  group = WhiteSpace,
  command = [[%s/\s\+$//e]],
})

autocmd("TextYankPost", {
  desc = "Highlight when yank",
  group = YankGroup,
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 50,
    })
  end,
})

autocmd("QuickFixCmdPost", {
  group = TroubleGroup,
  callback = function()
    vim.cmd([[Trouble quickfix open]])
  end,
})
