-- workspace location
hl.workspace_rule({ workspace = "1", monitor = "DP-1" })
hl.workspace_rule({ workspace = "2", monitor = "DP-1", layout = "scrolling" })
hl.workspace_rule({ workspace = "3", monitor = "DP-1" })
hl.workspace_rule({ workspace = "4", monitor = "DP-2", layout = "scrolling" })
hl.workspace_rule({ workspace = "5", monitor = "DP-2" })
hl.workspace_rule({ workspace = "10", monitor = "DP-1" })

hl.workspace_rule({ workspace = "special:todo", on_created_empty = "superproductivity" })
hl.workspace_rule({ workspace = "special:notes", on_created_empty = "zennotes" })
hl.workspace_rule({ workspace = "special:draw", on_created_empty = "rnote" })
hl.workspace_rule({ workspace = "special:sys", on_created_empty = "kitty --title 'HTOP' htop" })
