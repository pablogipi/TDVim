local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filename = {
	"filename",
	file_status = true, -- Displays file status (readonly status, modified status)
	path = 1, -- 0: Just the filename
	-- 1: Relative path
	-- 2: Absolute path
	-- 3: Absolute path, with tilde as the home directory
	shorting_target = 40, -- Shortens path to leave 40 spaces in the window
	-- for other components. (terrible name, any suggestions?)
	symbols = {
		-- modified = '[+]',      -- Text to show when the file is modified.
		-- readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
		-- modified = '',      -- Text to show when the file is modified.
		modified = "", -- Text to show when the file is modified.
		readonly = "", -- Text to show when the file is non-modifiable or readonly.
		unnamed = "[No Name]", -- Text to show for unnamed buffers.
		newfile = "[New]", -- Text to show for new created file before first writting
	},
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = true,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

local windows = {
	"windows",
  mode=2,
}
-- Buffers components
local buffers = {
	"buffers",
	show_filename_only = true, -- Shows shortened relative path when set to false.
	hide_filename_extension = true, -- Hide filename extension when set to true.
	show_modified_status = true, -- Shows indicator when the buffer is modified.

	mode = 0, -- 0: Shows buffer name
	-- 1: Shows buffer index
	-- 2: Shows buffer name + buffer index
	-- 3: Shows buffer number
	-- 4: Shows buffer name + buffer number

	max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
	-- it can also be a function that returns
	-- the value of `max_length` dynamically.
	filetype_names = {
		TelescopePrompt = "Telescope",
		dashboard = "Dashboard",
		packer = "Packer",
		fzf = "FZF",
		alpha = "Alpha",
		startify = "Startify",
		NvimTree = "Explorer",
		toggleterm = "Terminal",
	}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

	--[[ buffers_color = {
		-- Same values as the general color option can be used here.
		active = "lualine_{section}_normal", -- Color for active buffer.
		inactive = "lualine_{section}_inactive", -- Color for inactive buffer.
	}, ]]

	symbols = {
		modified = " ●", -- Text to show when the buffer is modified
		alternate_file = "#", -- Text to show to identify the alternate file
		directory = "", -- Text to show when the buffer is a directory
	},
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "solarized_light",
		-- theme = "tomorrow",
		-- component_separators = { left = "", right = "" },
    -- component_separators = { left = '', right = '' },
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		-- disabled_filetypes = { "dashboard", "NvimTree", "Outline", "startify", "NerdTree", "Prompt", "TelescopePrompt"  },
		disabled_filetypes = { "dashboard", "Outline", "startify", "NerdTree", "Prompt", "TelescopePrompt", "toggleterm"  },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { filename },
		lualine_c = { diff, diagnostics },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		-- lualine_x = { diff, spaces, "encoding", filetype },
		lualine_x = { branch, filetype },
		-- lualine_y = { location },
		lualine_y = { },
		lualine_z = { location, progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = { "buffers" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = { 'tabs' },
		lualine_z = { 'o:titlestring' },
	},
	--[[ winbar = {
		lualine_a = {windows},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	}, ]]
	extensions = {
    'quickfix',
    -- 'nvim-tree',
    'nerdtree',
    'toggleterm',
  },
})
