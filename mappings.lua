local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  i = {
    ["<C-h>"] = "",
  },
}

M.general = {
  n = {
    [","] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },
    ["<C-w>M"] = { "<C-w>| <C-w>_", "maximize current pane" },
    ["<C-w>m"] = { "<C-w>=", "minimize current pane" },
  },
}

M.telescope = {
  n = {
    ["<leader>,"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>ff"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>fg"] = { "<cmd> Telescope git_files <CR>", "find git files" },
    ["<leader>fa"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>fw"] = { "<cmd> Telescope grep_string <CR>", "grep string" },
  },
}

M.lspsage = {
  n = {
    ["gh"] = { "<cmd>Lspsaga finder<CR>", "lsp declaration" },
    ["<Leader>t"] = { "<cmd>Lspsaga term_toggle<CR>", "outgoing calls" },
    ["<Leader>gr"] = { "<cmd>Lspsaga rename<CR>", "rename" },
    ["<Leader>gd"] = { "<cmd>Lspsaga peek_definition<CR>", "peek definition" },
    ["<Leader>gD"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "buf definition" },
    ["<Leader>sl"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "show line deagnostics" },
    ["<Leader>sc"] = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "show cursor diagnostics" },
    ["<Leader>sb"] = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "show buffer diagnostics" },
    ["[e"] = { "<cmd>Lspsaga diagnostics_jump_prev<CR>", "diagnostics jump prev" },
    ["]e"] = { "<cmd>Lspsaga diagnostics_jump_next<CR>", "diagnostics jump next" },
    ["<Leader>o"] = { "<cmd>Lspsaga outline<CR>", "outline" },
    ["K"] = { "<cmd>Lspsaga hover_doc ++keep<CR>", "hover" },
    ["<Leader>ci"] = { "<cmd>Lspsaga incoming_calls<CR>", "incoming calls" },
    ["<Leader>co"] = { "<cmd>Lspsaga outgoing_calls<CR>", "outgoing calls" },
    ["<Leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "code action" },
  },

  v = {
    ["<Leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "code action" },
  },
}
M.NeoZoom = {
  n = {
    ["<leader>fp"] = { "<cmd> NeoZoomToggle <CR>", "floating current pane" },
  },
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
        
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
        
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger"
    }
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug to test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags",
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags",
    },
  },
}

return M
