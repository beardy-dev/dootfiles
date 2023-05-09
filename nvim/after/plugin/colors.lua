-- vim.cmd.colorscheme("catppuccin-mocha")
require("catppuccin").setup({
	flavour = "mocha",
	background = {
	},
	transparent_background = true,
	show_end_of_buffer = false,
	styles = {
		comments = {"italic"},
		conditionals = {"italic"}
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		telescope = true,
	}
})

vim.cmd.colorscheme("catppuccin")
