
-- netrw configuration
vim.g.netrw_liststyle = 3	--enables tree view
vim.g.netrw_banner = 1		--controls the banner
vim.g.netrw_browse_split = 0	--when selecting a file it determines if the netrw is closed or split
vim.g.netrw_preview = 1		--preview style
vim.g.netrw_winsize = 20	--split size

function transparency()
	-- Set transparency for the entire Neovim window
	vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])
	vim.cmd([[ hi NonText guibg=NONE ctermbg=NONE ]])

	-- Set transparency for the floating windows (popup menus, previews, etc.)
	vim.cmd([[ hi NormalNC guibg=NONE ctermbg=NONE ]])

	-- Set transparency for the command-line window
	vim.cmd([[ hi Command guibg=NONE ctermbg=NONE ]])

	-- Set transparency for the LSP notifications
	vim.cmd([[ hi LspDiagnosticsDefaultWarning guibg=NONE ctermbg=NONE ]])
	vim.cmd([[ hi LspDiagnosticsDefaultError guibg=NONE ctermbg=NONE ]])
	vim.cmd([[ hi LspDiagnosticsDefaultHint guibg=NONE ctermbg=NONE ]])
	vim.cmd([[ hi LspDiagnosticsDefaultInformation guibg=NONE ctermbg=NONE ]])

	-- Enable transparency for nvim-tree
	vim.cmd[[ hi NvimTreeNormal guibg=NONE ctermbg=NONE ]]
	vim.cmd[[ hi NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE ]]

	-- set the line number color
	vim.cmd(":hi LineNr guifg=#ffffff")
end

local transparent_gui = true

if transparent_gui then
	transparency()
end


-- set rules
-- Enable case-insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true



vim.opt.number = true			-- Enable line numbers
vim.opt.relativenumber = true		-- Enable relative line counter
vim.opt.clipboard = "unnamedplus"	-- sets the yank to the system clipboard
vim.opt.scrolloff = 10			-- while scrolling the program will keep a padding of 10 lines
vim.opt.sidescrolloff = 10		-- same as the above, but for sidescroll
vim.opt.tabstop = 4			-- size of the tab
vim.opt.showtabline = 1
vim.opt.termguicolors = true




