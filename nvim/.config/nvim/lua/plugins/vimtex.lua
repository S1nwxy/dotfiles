return {
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_compiler_method = "latexmk"

			vim.g.vimtex_compiler_latexmk = {
				options = {
					"-shell-escape",
					"-verbose",
					--		"-file-line-error",
					"-synctex=1",
					"-interaction=nonstopmode",
					"-r /home/jojo/.latexmkrc",
					-- "-auxdir=auxiliaries",
					"-bibtex",
				},
			}
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_quickfix_open_on_warning = 0
			vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
			vim.g.vimtex_quickfix_method = "pplatex"
			vim.g.vimtex_fold_enabled = 1
			vim.g.vimtex_fold_manual = 1
		end,
	},
}
