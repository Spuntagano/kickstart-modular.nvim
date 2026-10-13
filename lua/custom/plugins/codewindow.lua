return {
  'gorbit99/codewindow.nvim',
  config = function()
    -- nvim-treesitter's `main` branch dropped ts_utils; codewindow only needs get_vim_range from it
    package.preload['nvim-treesitter.ts_utils'] = package.preload['nvim-treesitter.ts_utils']
      or function()
        return {
          get_vim_range = function(range, buf)
            local srow, scol, erow, ecol = unpack(range)
            srow, scol, erow = srow + 1, scol + 1, erow + 1
            if ecol == 0 then
              erow = erow - 1
              if not buf or buf == 0 then
                ecol = vim.fn.col { erow, '$' } - 1
              else
                ecol = #vim.api.nvim_buf_get_lines(buf, erow - 1, erow, false)[1]
              end
              ecol = math.max(ecol, 1)
            end
            return srow, scol, erow, ecol
          end,
        }
      end
    local codewindow = require 'codewindow'
    codewindow.setup {
      active_in_terminals = false, -- Should the minimap activate for terminal buffers
      auto_enable = true, -- Automatically open the minimap when entering a (non-excluded) buffer (accepts a table of filetypes)
      exclude_filetypes = { 'help' }, -- Choose certain filetypes to not show minimap on
      max_minimap_height = nil, -- The maximum height the minimap can take (including borders)
      max_lines = nil, -- If auto_enable is true, don't open the minimap for buffers which have more than this many lines.
      minimap_width = 16, -- The width of the text part of the minimap
      use_lsp = true, -- Use the builtin LSP to show errors and warnings
      use_treesitter = true, -- Use nvim-treesitter to highlight the code
      use_git = true, -- Show small dots to indicate git additions and deletions
      width_multiplier = 4, -- How many characters one dot represents
      z_index = 1, -- The z-index the floating window will be on
      show_cursor = false, -- Show the cursor position in the minimap
      screen_bounds = 'background', -- How the visible area is displayed, "lines": lines above and below, "background": background color
      window_border = 'none', -- The border style of the floating window (accepts all usual options)
      relative = 'win', -- What will be the minimap be placed relative to, "win": the current window, "editor": the entire editor
      events = { 'TextChanged', 'InsertLeave', 'DiagnosticChanged', 'FileWritePost' }, -- Events that update the code window
    }
    codewindow.apply_default_keybinds()
  end,
}
