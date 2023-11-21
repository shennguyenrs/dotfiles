return {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    opts = {
        hooks = {
            diff_buf_win_enter = function(bufnr, winid, ctx)
                if ctx.layout_name:match("^diff2") then
                    if ctx.symbol == "a" then
                        vim.opt_local.winhl = table.concat({
                            "DiffAdd:DiffviewDiffAddAsDelete",
                            "DiffDelete:DiffviewDiffDelete",
                        }, ",")
                    elseif ctx.symbol == "b" then
                        vim.opt_local.winhl = table.concat({
                            "DiffDelete:DiffviewDiffDelete",
                        }, ",")
                    end
                end
            end,
        }
    }
}
