return {

	"windwp/nvim-autopairs",
	event = "InsertEnter",
	-- config = true,
	opts = {
		fast_wrap = {},
		disable_filetype = { "TelescopePrompt", "vim" },
	},
	config = function(_, opts)
		local Rule = require("nvim-autopairs.rule")
		local npairs = require("nvim-autopairs")

		npairs.setup(opts)

		npairs.add_rule(Rule("$$", "$$", "tex"))
	end,
}
