local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'angularls',
	'html', 
	'rust_analyzer',
	'tailwindcss',
	'lua_ls'
})
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = { }
})
lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function (client, bufnr)

 local opts = {buffer = bufnr, remap = false}

 vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts) -- jump to definition
 vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts) -- "hovers" over symbol, providing information
 vim.keymap.set("n", "<leader>vcw", function() vim.lsp.buf.workspace_symbol() end, opts) -- searches workspace for matching query
 vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts) -- opens diagnostic (error) window
 vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts) -- goes to next error in file
 vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts) -- goes to prev error in file
 vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts) -- available actions for errors and shit
 vim.keymap.set("n", "<leader>vfr", function() vim.lsp.buf.references() end, opts) -- find references
 vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts) -- rename shit
end)

lsp.setup()
