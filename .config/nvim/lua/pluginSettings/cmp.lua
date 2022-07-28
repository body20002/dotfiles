local cmp = require 'cmp'
local luasnip = require "luasnip"

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
               vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,
                                                                          col)
                   :match("%s") == nil
end

-- local feedkey = function(key, mode)
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
-- end

cmp.setup({
    -- completion = {completeopt = 'menu,menuone,preview'},
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },

    mapping = {
        -- ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        -- ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        -- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<Down>'] = cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Select
        }),
        ['<Up>'] = cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Select
        }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})
    },
    sources = {
        {name = 'nvim_lsp'}, {name = 'luasnip'}, {name = 'spell'},
        {name = 'cmp_tabnine'}, {name = 'treesitter'}, {name = 'buffer'}
    },
    formatting = {
        format = require("lspkind").cmp_format({
            mode = "symbol_text",
            menu = ({
                buffer = "[Buffer]",
                cmp_tabnine = "[AI]",
                latex_symbols = "[LaTeX]",
                luasnip = "[LuaSnip]",
                nvim_lsp = "[LSP]",
                spell = "[Spell]",
                treesitter = "[TreeSitter]"
            })
        })
    }
})
require("luasnip.loaders.from_vscode").lazy_load()
-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
