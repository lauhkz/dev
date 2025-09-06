return {
	{
		'saghen/blink.cmp',
		dependencies = 'rafamadriz/friendly-snippets',

		version = 'v0.*',

		opts = {
			keymap = { preset = 'default' },

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = 'mono'
			},

			signature = { enabled = true }
		},
	},
	'rafamadriz/friendly-snippets',
	config = function()
		require('luasnip.loaders.from_vscode').lazy_load()
	end,
}
