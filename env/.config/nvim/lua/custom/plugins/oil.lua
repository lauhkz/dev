return {
	"https://github.com/stevearc/oil.nvim",
	config = function()
	require "oil".setup({
		view_options = {
			show_hidden = true,
		}
	})
	vim.keymap.set('n', '-', ":Oil<CR>")
end,
}
