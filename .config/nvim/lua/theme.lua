local function set_theme()
  vim.cmd.colorscheme(vim.o.background == "light" and "rose-pine-dawn" or "rose-pine")
  vim.cmd [[
    hi Pmenusel gui=bold
    hi CursorLine gui=underline
  ]]
end

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = set_theme,
})

set_theme()
