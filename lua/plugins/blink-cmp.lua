return {
	"saghen/blink.cmp",

	enabled = true,
	lazy = false, -- lazy loading handled internally
	version = "*",

	opts = {
		friendly_snippets = false,

		keymap = {
			preset = "enter",
			["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
		},
		completion = {
			documentation = { auto_show = true },
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
		},
		cmdline = {
			enabled = false,
		},
	},
}
