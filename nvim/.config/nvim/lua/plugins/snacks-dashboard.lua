-- lazy.nvim
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      pane_gap = 0,
      preset = {
        header = [[
                                                                   
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████]],
      },
      sections = {
        -- Single-pane for narrow screens
        {
          enabled = function()
            return vim.o.columns < 160
          end,
          {
            section = "header",
          },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
        -- Two-pane for wide screens
        {
          enabled = function()
            return vim.o.columns >= 160
          end,
          {
            text = {
              [[                                         
                                                         
                             ████ ██████           █
                            ███████████             
                            █████████ ███████████
                           █████████  ███    █████
                          █████████ ██████████ █
                        ███████████ ███    ███ █
                       ██████  ███████████████████
              ]],
              hl = "SnacksDashboardHeader",
            },
            align = "right",
            padding = 0,
          },
          { section = "keys", gap = 1, padding = 1 },
          -- Split header right half for wide screens
          {
            pane = 2,
            text = {
                [[                   
                                 
████      ██                    
█████                            
████████ ███   ███████████  
████████ █████ ██████████████  
████████ █████ █████ ████ █████  
████████ █████ █████ ████ █████ 
██ ████ █████ █████ ████ ██████
              ]],
              hl = "SnacksDashboardHeader",
            },
            align = "left",
          },
          { pane = 2, icon = "   ", title = "Recent Files", section = "recent_files", cwd = true, indent = 4, padding = 4 },
          { pane = 2, icon = "   ", title = "Projects",     section = "projects",     indent = 4, padding = 4 },
          { section = "startup" },
        },
      },
    },
  },
}
