-- custom action keymaps
vim.keymap.set("n", "<leader>;", "A;<Esc>j", {noremap = true, silent = true, desc = "Add a ; to the end of the line"})

-- netrw keymaps
function vesplore()

	vim.g.netrw_browse_split = 4
	vim.g.netrw_banner = 0
	vim.cmd([[Vexplore]])
end

function explore()

	vim.g.netrw_browse_split = 0
	vim.g.netrw_banner = 1
	vim.cmd([[Explore]])
end

vim.keymap.set("n", "<leader>fe", explore, { noremap = true, silent = true, desc = '[netrw] full size explorer'})
vim.keymap.set("n", "<leader>fv", vesplore, { noremap = true, silent = true, desc = '[netrw] sidebar explorer'})


-- nvim compiler keymaps
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
-- Open compiler
vim.keymap.set('n', '<F6>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.keymap.set('n', '<S-F6>',
  "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
  { noremap = true, silent = true })

-- Toggle compiler results
vim.keymap.set('n', '<S-F7>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })


--Neo-tree mappings
vim.keymap.set('n', '<leader>xt', ':Neotree toggle<CR>', { noremap = true, silent = true, desc = '[Nt] Toggle File explorer'})
vim.keymap.set('n', '<leader>xs', ':Neotree show<CR>', { noremap = true, silent = true, desc = '[Nt] Show File explorer'})
vim.keymap.set('n', '<leader>xf', ':Neotree focus<CR>', { noremap = true, silent = true, desc = '[Nt] Focus File explorer'})
vim.keymap.set('n', '<leader>xx', ':Neotree position=current<CR>', { noremap = true, silent = true, desc = '[Nt] Expand File explorer'})


-- telescope keybinds
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end
vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

--Tabs keymaps

vim.keymap.set('n', '<Tab>n', ':tabnew<CR>', {noremap = true, silent = true, desc = "[Tabs] create new tab"})
vim.keymap.set('n', '<Tab>d', ':tabclose<CR>', {noremap = true, silent = true, desc = "[Tabs] delete tab"})
vim.keymap.set('n', '<Tab>]', ':tabnext<CR>', {noremap = true, silent = true, desc = "[Tabs] goto next tab"})
vim.keymap.set('n', '<Tab>[', ':tabprevious<CR>', {noremap = true, silent = true, desc = "[Tabs] got previous tab"})
