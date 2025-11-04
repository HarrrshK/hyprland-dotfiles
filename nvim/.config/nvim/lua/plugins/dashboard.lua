return {
  "folke/snacks.nvim",
  opts = {
    mappings = {
      n = {
        ["<Leader>c"] = {
          function()
            local bufs = vim.fn.getbufinfo { buflisted = true }
            require("astrocore.buffer").close(0)
            if #bufs <= 1 then
              require("snacks").dashboard()
            end
          end,
          desc = "Close buffer / Return to dashboard",
        },
      },
    },

    dashboard = {
      preset = {
        header = table.concat({
          [[        _______AAAA____       ____AAAA________]],
          [[       VVVV               VVVV        ]],
          [[       (__)               (__)       ]],
          [[        \ \               / /        ]],
          [[         \ \   \\|||//   / /         ]],
          [[          > \   _   _   / <          ]],
          [[ hang      > \ / \ / \ / <           ]],
          [[  in        > \\_o_o_// <            ]],
          [[  there...   > ( (_) ) <             ]],
          [[              >|     |<              ]],
          [[             / |\___/| \             ]],
          [[             / (_____) \             ]],
          [[             /         \             ]],
          [[              /   o   \              ]],
          [[               ) ___ (               ]],
          [[              / /   \ \              ]],
          [[             ( /     \ )             ]],
          [[             ><       ><             ]],
          [[            ///\     /\\\            ]],
          [[            '''       '''            ]],
        }, "\n"),
      },

      sections = {
        { section = "header", padding = 1 },

    
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
