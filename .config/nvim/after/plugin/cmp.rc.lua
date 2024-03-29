local status, cmp = pcall(require, 'cmp')
if not status then
  print('Cmp is not installed')
  return
end

local luasnip = require('luasnip')
require("cmp_nvim_ultisnips").setup {}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and
      vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,
        col)
      :match('%s') == nil
end

local lsp_symbols = {
  Text = "   (Text) ",
  Method = "   (Method)",
  Function = "   (Function)",
  Constructor = "   (Constructor)",
  Field = " ﴲ  (Field)",
  Variable = "[] (Variable)",
  Class = "   (Class)",
  Interface = " ﰮ  (Interface)",
  Module = "   (Module)",
  Property = " 襁 (Property)",
  Unit = "   (Unit)",
  Value = "   (Value)",
  Enum = " 練 (Enum)",
  Keyword = "   (Keyword)",
  Snippet = "   (Snippet)",
  Color = "   (Color)",
  File = "   (File)",
  Reference = "   (Reference)",
  Folder = "   (Folder)",
  EnumMember = "   (EnumMember)",
  Constant = " ﲀ  (Constant)",
  Struct = " ﳤ  (Struct)",
  Event = "   (Event)",
  Operator = "   (Operator)",
  TypeParameter = "   (TypeParameter)"
}

if cmp ~= nil then
  cmp.setup({
    snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
    formatting = {
      format = function(entry, item)
        item.kind = lsp_symbols[item.kind]
        item.menu = ({
          nvim_lsp = "[LSP]",
          ultisnips = "[Ulti]",
          luasnip = "[LuaS]",
          buffer = "[Buff]",
          path = "[Path]"
        })[entry.source.name]

        return item
      end
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered()
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { 'i', 's' }),

      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' })
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' }, { name = 'ultisnips' }, { name = 'luasnip' },
      { name = 'buffer' }, { name = 'path' }
    })
  })

  vim.cmd [[
  set completeopt=menuone,noinsert,noselect
]]

end
