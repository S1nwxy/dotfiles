return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end,
	-- ys : add surround -> ys<motion><delimeter>
	-- cs : change surround  -> cs<motion><delimeter>
	-- ds : delete surround  -> ds<delimeter>
	-- add 't' to enable HTML mode : yst, cst, dst
}
