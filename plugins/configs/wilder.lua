local present, wilder = pcall(require, "wilder")

if not present then
    print "wilder not found"
else
    wilder.setup {
        modes = { ":" },
        next_key = 0,
        previous_key = 0,
        reject_key = 0,
        accept_key = 0,
    }
    vim.api.nvim_command "silent! UpdateRemotePlugins" -- NOTE: 需要载入一次py依赖 不然模糊过滤等失效
end
-- NOTE: 设置 source
wilder.set_option("pipeline", {
    wilder.branch(
    -- NOTE: 当默认无输入时 展示15条历史记录
        {
            wilder.check(function(_, x)
                return vim.fn.empty(x)
            end),
            wilder.history(15),
        },
        -- NOTE: 当输入时 展示所有匹配项(模糊匹配)
        wilder.cmdline_pipeline {
            fuzzy = 1,
            fuzzy_filter = wilder.vim_fuzzy_filter(),
        },
        wilder.python_search_pipeline {
            -- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
            pattern = wilder.python_fuzzy_pattern(),
            -- omit to get results in the order they appear in the buffer
            sorter = wilder.python_difflib_sorter(),
            -- can be set to 're2' for performance, requires pyre2 to be installed
            -- see :h wilder#python_search() for more details
            engine = "re2",
        },
        wilder.python_file_finder_pipeline {
            -- to use ripgrep : {'rg', '--files'}
            -- to use fd      : {'fd', '-tf'}
            file_command = { "find", ".", "-type", "f", "-printf", "%P\n" },
            -- to use fd      : {'fd', '-td'}
            dir_command = { "find", ".", "-type", "d", "-printf", "%P\n" },
            -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
            -- found at https://github.com/nixprime/cpsm
            filters = { "fuzzy_filter", "difflib_sorter" },
        },
        -- pipeline for search
        wilder.search_pipeline(),
        wilder.python_search_pipeline()
    ),
})
-- NOTE: 设置样式
wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
        -- 设置特定高亮
        highlights = {
            accent = "WilderAccent",
            selected_accent = "WilderSelectedAccent",
        },
        highlighter = wilder.basic_highlighter(),
        left = { " ", wilder.popupmenu_devicons() }, -- 左侧加入icon
        right = { " ", wilder.popupmenu_scrollbar() }, -- 右侧加入滚动条
        border = "rounded",
        max_height = 17,                           -- 最大高度限制 因为要计算上下 所以17支持最多15个选项
    })
)
-- NOTE: 设置高亮
vim.api.nvim_set_hl(0, "WilderAccent", { fg = "#5f87ff" })
vim.api.nvim_set_hl(0, "WilderSelectedAccent", { fg = "#5f87ff", bg = "#4e4e4e" })
-- NOTE: 设置快捷键
vim.api.nvim_set_keymap(
    "c",
    "<tab>",
    [[wilder#in_context() ? wilder#next() : '<tab>']],
    { noremap = true, expr = true }
)
vim.api.nvim_set_keymap(
    "c",
    "<C-n>",
    [[wilder#in_context() ? wilder#next() : '<down>']],
    { noremap = true, expr = true }
)
vim.api.nvim_set_keymap(
    "c",
    "<C-p>",
    [[wilder#in_context() ? wilder#previous() : '<up>']],
    { noremap = true, expr = true }
)
vim.api.nvim_set_keymap("c", "0", "0", {}) -- 不清楚原因导致0无法使用 强制覆盖
