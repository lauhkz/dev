return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	enabled = false,
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-lua/plenary.nvim" },
		"nvim-telescope/telescope-smart-history.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"kkharji/sqlite.lua",
	},
	config = function()
		require("custom.telescope")
	end,
}
