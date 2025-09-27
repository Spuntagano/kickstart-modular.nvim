vim.opt.list = true
vim.opt.listchars:append 'space:⋅'
vim.opt.listchars:append 'trail:⋅'

local config = {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = function()
      return {
        indent = { char = '┃' },
      }
    end,
    init = function()
      local hooks = require 'ibl.hooks'
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
    end,
  },
}

return config
