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
    ["<Leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "code action" },
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
    ["<Leader>t"] = { "<cmd>Lspsaga term_toggle<CR>", "outgoing calls" },
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
                require('crates').upgrade_all_crates()
            end,
            "update crates"
        }
    }
}
return M
