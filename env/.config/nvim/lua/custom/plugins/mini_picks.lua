return {
	"nvim-mini/mini.pick",
	version = "*",
	enabled = true,
	config = function()
		require("mini.pick").setup()
		vim.keymap.set("n", "<leader>fd", ":Pick files<CR>")
		vim.keymap.set("n", "<leader>fh", ":Pick help<CR>")
		vim.keymap.set("n", "<leader>fg", ":Pick grep_live<CR>")
	end,
}
