return {
	"https://github.com/vague2k/vague.nvim",
	config = function()
		require "vague".setup({
			transparent = true,
			italic = false
		})
		vim.cmd("colorscheme vague")
		vim.cmd(":hi statusline guibg=NONE")
end,
}
