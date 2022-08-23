vim.g.matchup_matchparen_defferred = 1
vim.g.matchup_matchparen_offscreen = { method = 'status' }
vim.g.matchup_matchparen_hi_surround_always = 1

vim.cmd [[
augroup matchup_matchparen_highlight
    autocmd!
    autocmd ColorScheme * hi MatchParen guifg=red
augroup END
]]
