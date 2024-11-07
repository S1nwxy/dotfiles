return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "pylint" },
			cpp = { "cpplint" },
			latex = { "lacheck" },
		}
	end,
}