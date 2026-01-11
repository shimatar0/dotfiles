return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte / frappe / macchiato / mocha
				background = {
					light = "latte",
					dark = "mocha",
				},
				dim_inactive = {
					enabled = false,
					shade = 'dark',
					percentage = 0.15,
				},
				transparent_background = false,
				term_colors = false,
				integrations = {
					cmp = true,
					gitsigns = true,
          treesitter = true,
          telescope = { enabled = true },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
