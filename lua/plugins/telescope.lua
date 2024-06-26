require 'utils'

local get_fzf_native_build = function()
  if (GetOS() == 'Windows') then
    return
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  else
    return 'make'
  end
end

return {
  'nvim-telescope/telescope-ui-select.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = get_fzf_native_build() },

  {
    'nvim-telescope/telescope.nvim',
    -- branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'BurntSushi/ripgrep', 'sharkdp/fd' },
    config = function()
      require 'telescope'.setup {
        defaults = {
          mappings = {
            i = {
              ['<A-q>'] = require 'telescope.actions'.send_selected_to_qflist,
            },
          },
        },

        extensions = {
          ['ui-select'] = {
            require 'telescope.themes'.get_dropdown {}
          },
        }
      }

      local builtin = require 'telescope.builtin'
      local themes = require 'telescope.themes'
      local utils = require 'telescope.utils'

      vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search Git files' })
      vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Project Files' })
      vim.keymap.set('n', '<leader>pw', builtin.find_files, { desc = 'Project Files' })
      vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Grep Search' })
      vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Search Help' })
      vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = 'Search Diagnostics' })
      vim.keymap.set('n', '<leader>pc', builtin.commands, { desc = 'Search Commands' })
      vim.keymap.set('n', '<leader>pm', builtin.man_pages, { desc = 'Search Manual Pages' })
      vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = 'Search Resume' })
      vim.keymap.set('n', '<leader>pk', builtin.keymaps, { desc = 'Search Keymaps' })
      vim.keymap.set('n', '<leader>pq', builtin.quickfix, { desc = 'Search Quickfix' })
      vim.keymap.set('n', '<leader>pw', function()
        local input = vim.fn.input 'Grep > '
        if input ~= '' then
          builtin.grep_string { search = input }
        end
      end, { desc = 'Find word' })

      vim.keymap.set('n', '<leader>pW', function()
        builtin.grep_string { search = vim.fn.expand '<cword>' }
      end)

      vim.keymap.set('n', '<leader>ps', function()
        builtin.find_files { cwd = utils.buffer_dir() }
      end, { desc = 'Files in current dir' })

      vim.keymap.set('n', '<leader>pa', function()
        builtin.live_grep { cwd = utils.buffer_dir() }
      end, { desc = 'Grep Search in current dir' })

      vim.keymap.set('n', '<leader>b', function()
        builtin.buffers { only_cwd = true, sort_lastused = true }
      end, { desc = '[ ] Find existing buffers' })

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(themes.get_dropdown { previewer = builtin.file_browser, })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Search Git commits' })
      vim.keymap.set('n', '<leader>gh', builtin.git_bcommits, { desc = 'Search buffer Git commits' })
      vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Search Git branches' })
      vim.keymap.set('n', '<leader>gt', builtin.git_status, { desc = 'Search Git status' })
      vim.keymap.set('n', '<leader>gx', builtin.git_stash, { desc = 'Search Git stash' })

      require 'telescope'.load_extension 'fzf'
      require 'telescope'.load_extension 'ui-select'
    end
  },
}
