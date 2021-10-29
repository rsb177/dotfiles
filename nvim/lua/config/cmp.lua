local cmp = prequire("cmp")
if not cmp then
    return
end

local lspkind = prequire("lspkind")
if not lspkind then
    return
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
    TypeParameter = "   (TypeParameter)",
}

cmp.setup({
    confirmation = { default_behaviour = cmp.ConfirmBehavior.Replace },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "luasnip" },
    },
    mapping = {
        ["<s-tab>"] = cmp.mapping.select_prev_item(),
        ["<tab>"] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    formatting = {
        format = function(entry, item)
            item.kind = lspkind.presets.default[item.kind]
            item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[Nvim]",
                path = "[Path]",
                luasnip = "[Snippet]",
            })[entry.source.name]

            return item
        end,
    },
    snippet = {
        expand = function(args)
            local luasnip = prequire("luasnip")
            if not luasnip then
                return
            end
            luasnip.lsp_expand(args.body)
        end,
    },
})
