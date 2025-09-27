-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>nn', ':Neotree toggle<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab  close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab  close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tabp
  },
  init = function()

    -- vim.api.nvim_create_augroup('neotree', {})
    -- vim.api.nvim_create_autocmd('UiEnter', {
    --  desc = 'Open Neotree automatically',
    --  group = 'neotree',
    --  callback = function()
    --    if vim.fn.argc() == 0 then
    --      vim.cmd 'Neotree toggle'
    --    end
    --  end,
    --})
  end,
}
