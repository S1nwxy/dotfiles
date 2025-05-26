return {
	"s1n7ax/nvim-comment-frame",
	requires = {
		{ "nvim-treesitter" },
	},
	config = function()
		require("nvim-comment-frame").setup()
	end,
}
