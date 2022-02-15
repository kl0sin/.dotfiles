local telescope = require 'telescope'
local actions = require 'telescope.actions'
local keymap = require 'lib.utils'.keymap

-- local telescope = require 'telescope'
-- local keymap = require 'lib.utils'.keymap

-- telescope.setup {
--    defaults = {
--        color_devicons = true,
--       layout_config = {
--            prompt_position = 'top',
--        },
--        file_ignore_patterns = { '.git/', 'node_modules/' },
--    },
--    pickers = {
--        sort_lastused = true,
--    },
--    extensions = {
--        fzf = {
--            fuzzy = true,
--            override_generic_sorter = true,
--            override_file_sorter = true,
--            case_mode = 'smart_case'
--        }
--    }
-- }

-- require('telescope').load_extension 'fzf'

keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])


telescope.setup {
    defaults = {
        color_devicons = true,
        prompt_prefix = '  ',
        selection_caret = '  ',
        layout_config = {
            prompt_position = 'top',
        },
        file_ignore_patterns = { '.git/', 'node_modules/' },
        sorting_strategy = 'ascending',
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
    },
    pickers = {
        sort_lastused = true,
        find_files = {
            hidden = true,
        },
    },
}

require('telescope').load_extension 'fzf'
