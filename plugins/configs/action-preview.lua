local present, actions = pcall(require, "actions-preview")

if not present then
  print "actions-preview not found"
else
  actions.setup{
    telescope={
            sorting_strategy = "ascending",
            layout_strategy = "vertical",
            layout_config = {
                width = 0.8,
                height = 0.9,
                prompt_position = "top",
                preview_cutoff = 20,
                preview_height = function(_,_,max_lines)
                    return max_lines - 15
                end,
            },
        },
    }
    
    vim.keymap.set({ "v", "n" }, "gf", actions.code_actions)
end
