local status, worktree = pcall(require, 'git-worktree')
if (not status) then return end

worktree.setup({})
