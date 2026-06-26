-- workspace location
hl.workspace_rule({ workspace = "1", monitor = "DP-1" })
hl.workspace_rule({ workspace = "2", monitor = "DP-1", layout = "scrolling" })
hl.workspace_rule({ workspace = "3", monitor = "DP-1" })
hl.workspace_rule({ workspace = "4", monitor = "DP-2", layout = "scrolling" })
hl.workspace_rule({ workspace = "10", monitor = "DP-1" })

hl.workspace_rule({ workspace = "special:todo", on_created_empty = "superproductivity" })
hl.workspace_rule({ workspace = "special:notes", on_created_empty = "zennotes" })
