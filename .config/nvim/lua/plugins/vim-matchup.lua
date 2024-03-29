return {
    'andymass/vim-matchup',
    event = "VeryLazy",
    config = function()
        vim.cmd [[
            let g:matchup_matchparen_defferred = 1
            let g:matchup_matchparen_offscreen = {'method': 'status'}
            let g:matchup_matchparen_hi_surround_always = 1
        ]]
    end
}
