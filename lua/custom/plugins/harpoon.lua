return {
  'ThePrimeagen/harpoon',
  config = function()
    require('harpoon').setup({
      global_settings = {
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },

        -- set marks specific to each git branch inside git repository
        -- Each branch will have it's own set of marked files
        mark_branch = true,

        -- enable tabline with harpoon marks
        tabline = false,
        tabline_prefix = "   ",
        tabline_suffix = "   ",
      }
  })
    -- harpoon
    vim.keymap.set('n', [[<leader>hm]], ':Telescope harpoon marks<CR>')

    vim.keymap.set('n', '<leader>h1', function()
      require('harpoon.mark').set_current_at(1)
    end)
    vim.keymap.set('n', '<leader>1', function()
      require("harpoon.ui").nav_file(1)
    end)

    vim.keymap.set('n', '<leader>h2', function()
      require('harpoon.mark').set_current_at(2)
    end)

    vim.keymap.set('n', '<leader>2', function()
      require("harpoon.ui").nav_file(2)
    end)

    vim.keymap.set('n', '<leader>h3', function()
      require('harpoon.mark').set_current_at(3)
    end)
    vim.keymap.set('n', '<leader>3', function()
      require("harpoon.ui").nav_file(3)
    end)

    vim.keymap.set('n', '<leader>h4', function()
      require('harpoon.mark').set_current_at(4)
    end)
    vim.keymap.set('n', '<leader>4', function()
      require("harpoon.ui").nav_file(4)
    end)

    vim.keymap.set('n', '<leader>h5', function()
      require('harpoon.mark').set_current_at(5)
    end)
    vim.keymap.set('n', '<leader>5', function()
      require("harpoon.ui").nav_file(5)
    end)

    vim.keymap.set('n', '<leader>h6', function()
      require('harpoon.mark').set_current_at(6)
    end)
    vim.keymap.set('n', '<leader>6', function()
      require("harpoon.ui").nav_file(6)
    end)

    vim.keymap.set('n', '<leader>h7', function()
      require('harpoon.mark').set_current_at(7)
    end)
    vim.keymap.set('n', '<leader>7', function()
      require("harpoon.ui").nav_file(7)
    end)

    vim.keymap.set('n', '<leader>h8', function()
      require('harpoon.mark').set_current_at(8)
    end)
    vim.keymap.set('n', '<leader>8', function()
      require("harpoon.ui").nav_file(8)
    end)

    vim.keymap.set('n', '<leader>h9', function()
      require('harpoon.mark').set_current_at(9)
    end)
    vim.keymap.set('n', '<leader>9', function()
      require("harpoon.ui").nav_file(9)
    end)

    -- Harpoon Which-key mappings
    local wk = require('which-key')
    wk.add({
        { "<leader>h", group = "harpoon" },
        { "<leader>1", hidden = true },
        { "<leader>h1", hidden = true },
        { "<leader>2", hidden = true },
        { "<leader>h2", hidden = true },
        { "<leader>3", hidden = true },
        { "<leader>h3", hidden = true },
        { "<leader>4", hidden = true },
        { "<leader>h4", hidden = true },
        { "<leader>5", hidden = true },
        { "<leader>h5", hidden = true },
        { "<leader>6", hidden = true },
        { "<leader>h6", hidden = true },
        { "<leader>7", hidden = true },
        { "<leader>h7", hidden = true },
        { "<leader>8", hidden = true },
        { "<leader>h8", hidden = true },
        { "<leader>9", hidden = true },
        { "<leader>h9", hidden = true },
    })

    -- Harpoon telescope extension
    require('telescope').load_extension('harpoon')
  end,
}

-- vim: ts=2 sts=2 sw=2 et
