require("lazy").setup({
	spec = {
		{ import = "plugins" }
	},
	checker = { enabled = true, frequency = 3600 * 24 * 7 }
})
