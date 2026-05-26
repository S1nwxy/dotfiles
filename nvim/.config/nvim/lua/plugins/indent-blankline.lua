return {
	----------------------------------------------------------------------
	--                         Indent Blankline                         --
	--   This plugin draws vertical lines for each indent level,        --
	--                even on blankline (thus the name)                 --
	--          It can also highlight them, which we call the           --
	--                             "scope"                              --
	--         But it only do this for function scopes, not all         --
	--                          indent levels                           --
	--         That's why we use a second plugin for this scope         --
	--                        highlighting part                         --
	----------------------------------------------------------------------
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			local catppuccin_colors = {
				surface0 = "#313244", -- Almost invisible - just structural hints
				surface1 = "#45475a", -- Slightly more visible for nested levels
			}

			vim.api.nvim_set_hl(0, "IblIndent1", { fg = catppuccin_colors.surface0 })
			vim.api.nvim_set_hl(0, "IblIndent2", { fg = catppuccin_colors.surface1 })

			require("ibl").setup({
				indent = {
					char = "▏",
					highlight = "IblIndent1",
				},
				scope = {
					enabled = false,
				},
			})
		end,
	},
	----------------------------------------------------------------------
	--                         MINI.INDENTSCOPE                         --
	--             We use this plugin for scope hghlighting             --
	--        Since it can highlights every single indent levels        --
	--         We use it with no animation in order to get full         --
	--                          responsiveness                          --
	----------------------------------------------------------------------
	{
		"echasnovski/mini.indentscope",
		config = function()
			-- Use a much more prominent color and style for current scope
			vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#cba6f7" })

			require("mini.indentscope").setup({
				draw = {
					delay = 0, -- The time it takes to highlight after the cursor reached a specific indent level
					animation = require("mini.indentscope").gen_animation.none(),
				},
				mappings = {
					-- VISUAL mode keybinds
					object_scope = "ii", -- select inside the current scope
					object_scope_with_border = "ai", -- select inside + outside (top and bottim line of the scope). Use it multiple times to select more and more.
				},
				options = {
					border = "both",
					indent_at_cursor = true,
					try_as_border = false,
				},
				symbol = "▏",
			})
		end,
	},
}
