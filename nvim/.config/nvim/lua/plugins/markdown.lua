return {
	{
		"tadmccorkle/markdown.nvim",
		ft = "markdown", -- or 'event = "VeryLazy"'
		opts = {},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	-- install with yarn or npm
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	-- 	build = "cd app && yarn install",
	-- 	init = function()
	-- 		vim.g.mkdp_filetypes = { "markdown" }
	-- end,
	-- ft = { "markdown" },
	-- config = function()
	-- 	-- set to 1, nvim will open the preview window after entering the Markdown buffer
	-- 	-- default: 0
	-- 	vim.g.mkdp_auto_start = 0
	--
	-- 	-- set to 1, the nvim will auto close current preview window when changing
	-- 	-- from Markdown buffer to another buffer
	-- 	-- default: 1
	-- 	vim.g.mkdp_auto_close = 1
	--
	-- 	-- set to 1, Vim will refresh Markdown when saving the buffer or
	-- 	-- when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
	-- 	-- move the cursor
	-- 	-- default: 0
	-- 	vim.g.mkdp_refresh_slow = 1
	--
	-- 	-- set to 1, the MarkdownPreview command can be used for all files,
	-- 	-- by default it can be use in Markdown files only
	-- 	-- default: 0
	-- 	vim.g.mkdp_command_for_global = 0
	--
	-- 	-- set to 1, the preview server is available to others in your network.
	-- 	-- By default, the server listens on localhost (127.0.0.1)
	-- 	-- default: 0
	-- 	vim.g.mkdp_open_to_the_world = 0
	--
	-- 	-- use custom IP to open preview page.
	-- 	-- Useful when you work in remote Vim and preview on local browser.
	-- 	-- For more details see: https://github.com/iamcco/markdown-preview.nvim/pull/9
	-- 	-- default empty
	-- 	vim.g.mkdp_open_ip = ""
	--
	-- 	-- specify browser to open preview page
	-- 	-- for path with space
	-- 	-- valid: `/path/with\ space/xxx`
	-- 	-- invalid: `/path/with\\ space/xxx`
	-- 	-- default: ''
	-- 	-- vim.g.mkdp_browser = { "/usr/bin/firefox" }
	-- 	vim.cmd([[do FileType]])
	-- 	vim.cmd([[
	--               function OpenMarkdownPreview (url)
	--                   let cmd = "firefox --new-window " . shellescape(a:url) . " &"
	--                   silent call system(cmd)
	--               endfunction
	--           ]])
	-- 	-- set to 1, echo preview page URL in command line when opening preview page
	-- 	-- default is 0
	-- 	vim.g.mkdp_echo_preview_url = 1
	--
	-- 	-- a custom Vim function name to open preview page
	-- 	-- this function will receive URL as param
	-- 	-- default is empty
	-- 	vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
	--
	-- 	-- options for Markdown rendering
	-- 	-- mkit: markdown-it options for rendering
	-- 	-- katex: KaTeX options for math
	-- 	-- uml: markdown-it-plantuml options
	-- 	-- maid: mermaid options
	-- 	-- disable_sync_scroll: whether to disable sync scroll, default 0
	-- 	-- sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
	-- 	--   middle: means the cursor position is always at the middle of the preview page
	-- 	--   top: means the Vim top viewport always shows up at the top of the preview page
	-- 	--   relative: means the cursor position is always at relative positon of the preview page
	-- 	-- hide_yaml_meta: whether to hide YAML metadata, default is 1
	-- 	-- sequence_diagrams: js-sequence-diagrams options
	-- 	-- content_editable: if enable content editable for preview page, default: v:false
	-- 	-- disable_filename: if disable filename header for preview page, default: 0
	-- 	-- vim.g.mkdp_preview_options = {
	-- 	--      'mkit': {},
	-- 	--      'katex': {},
	-- 	--      'uml': {},
	-- 	--      'maid': {},
	-- 	--      'disable_sync_scroll': 0,
	-- 	--      'sync_scroll_type': 'middle',
	-- 	--      'hide_yaml_meta': 1,
	-- 	--      'sequence_diagrams': {},
	-- 	--      'flowchart_diagrams': {},
	-- 	--      'content_editable': v.false,
	-- 	--      'disable_filename': 0,
	-- 	--      'toc': {}
	-- 	--      }
	--
	-- 	-- use a custom Markdown style. Must be an absolute path
	-- 	-- like '/Users/username/markdown.css' or expand('~/markdown.css')
	-- 	vim.g.mkdp_markdown_css = ""
	--
	-- 	-- use a custom highlight style. Must be an absolute path
	-- 	-- like '/Users/username/highlight.css' or expand('~/highlight.css')
	-- 	vim.g.mkdp_highlight_css = ""
	--
	-- 	-- use a custom port to start server or empty for random
	-- 	vim.g.mkdp_port = ""
	--
	-- 	-- preview page title
	-- 	-- ${name} will be replace with the file name
	-- 	vim.g.mkdp_page_title = "「${name}」"
	--
	-- 	-- use a custom location for images
	-- 	-- vim.g.mkdp_images_path = /home/user/.markdown_images
	--
	-- 	-- recognized filetypes
	-- 	-- these filetypes will have MarkdownPreview... commands
	-- 	vim.g.mkdp_filetypes = { "markdown" }
	--
	-- 	-- set default theme (dark or light)
	-- 	-- By default the theme is falsedefined according to the preferences of the system
	-- 	vim.g.mkdp_theme = "dark"
	--
	-- 	-- combine preview window
	-- 	-- default: 0
	-- 	-- if enable it will reuse previous opened preview window when you preview markdown file.
	-- 	-- ensure to set let g:mkdp_auto_close = 0 if you have enable this option
	-- 	vim.g.mkdp_combine_preview = 0
	--
	-- 	-- auto refetch combine preview contents when change markdown buffer
	-- 	-- only when g:mkdp_combine_preview is 1
	-- 	vim.g.mkdp_combine_preview_auto_refresh = 1
	-- end,
	-- },
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
			-- default config:
			require("peek").setup({
				auto_load = true, -- whether to automatically load preview when
				-- entering another markdown buffer
				close_on_bdelete = true, -- close preview window on buffer delete

				syntax = true, -- enable syntax highlighting, affects performance

				theme = "dark", -- 'dark' or 'light'

				update_on_change = true,

				app = { "brave-browser", "--new-window" }, -- 'webview', 'browser', string or a table of strings
				-- explained below

				filetype = { "markdown" }, -- list of filetypes to recognize as markdown

				-- relevant if update_on_change is true
				throttle_at = 200000, -- start throttling when file exceeds this
				-- amount of bytes in size
				throttle_time = "auto", -- minimum amount of time in milliseconds
				-- that has to pass before starting new render
			})
		end,
	},
}
