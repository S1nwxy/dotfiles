return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"c",
				"cpp",
				"vim",
				"php",
				"lua",
				"html",
				"css",
				"javascript",
				"bash",
				"jsonc",
				"hyprlang",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			vim.filetype.add({
				extension = { rasi = "rasi" },
				pattern = {
					[".*/waybar/config"] = "jsonc",
					[".*/mako/config"] = "dosini",
					[".*/kitty/*.conf"] = "bash",
					[".*/hypr/.*%.conf"] = "hyprlang",
				},
			}),
		})
	end,
}