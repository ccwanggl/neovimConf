local M = {}

M.general = {
  i = {
    ["jk"] = { "<ESC>", "Escape insert mode", opts = { nowait = true } },
    ["<C-h>"] = { "<BS>", "delete left char" },
  },

  n = {
    [","] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },
  },
}

M.nvimtree = {

    ["<C-n>"] = {},
}

M.lspconfig = {
  n = {
    ["gh"] = {
      "<cmd>Lspsaga lsp_finder<CR>",
      "lsp declaration",
    },
    ["<Leader>ca"] = {
      "<cmd>Lspsaga code_action<CR>",
      "code action",
    },

    ["<Leader>gr"] = {
      "<cmd>Lspsaga rename<CR>",
      "rename",
    },

    ["<Leader>gd"] = {
      "<cmd>Lspsaga peek_definition<CR>",
      "rename",
    },

    ["<Leader>gd"] = {
      "<cmd>Lspsaga goto_definition<CR>",
      "rename",
    },

    ["<Leader>sl"] = {
      "<cmd>Lspsaga show_line_diagnostics<CR>",
      "rename",
    },

    ["<Leader>sc"] = {
      "<cmd>Lspsaga show_cursor_diagnostics<CR>",
      "rename",
    },

    ["<Leader>sb"] = {
      "<cmd>Lspsaga show_buf_diagnostics<CR>",
      "rename",
    },
    
    ["[e"] = {
      "<cmd>Lspsaga diagnostics_jump_prev<CR>",
      "rename",
    },


    ["]e"] = {
      "<cmd>Lspsaga diagnostics_jump_next<CR>",
      "rename",
    },

    ["<Leader>o"] = {
      "<cmd>Lspsaga outline<CR>",
      "rename",
    },

    ["K"] = {
      "<cmd>Lspsaga hover_doc ++keep<CR>",
      "hover",
    },

    ["<Leader>ci"] = {
      "<cmd>Lspsaga incoming_calls<CR>",
      "hover",
    },

    ["<Leader>co"] = {
      "<cmd>Lspsaga outgoing_calls<CR>",
      "hover",
    },
  },

  v = {
    ["<Leader>ca"] = {
      "<cmd>Lspsaga code_action<CR>",
      "code action",
    },
  }
}
return M
