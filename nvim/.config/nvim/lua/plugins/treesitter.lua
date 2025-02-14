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
				"c_sharp",
			},
			require("nvim-ts-autotag").setup({
				enable = true,
				filetypes = { "html", "xml", "tsx" },
			}),
			-- lvim.builtin.treesitter.autotag.enable = true
			auto_install = true,
			auto_tag = {
				enable = true,
				filetypes = { "html", "xml", "php", "vue" },
			},
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
