return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  -- cond = function()
  --   local getos = os.getenv("OS")
  --   -- this is only for my work laptop
  --   if getos ~= nil and string.find(getos:lower(), "windows") then
  --     return false
  --   else
  --     return true
  --   end
  -- end,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
  },
}
