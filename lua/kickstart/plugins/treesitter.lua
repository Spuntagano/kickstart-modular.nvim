return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    branch = 'main', -- `master` is archived and breaks on Neovim 0.12; `main` requires the `tree-sitter` CLI
    lazy = false,
    build = ':TSUpdate',
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    config = function()
      local ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'python',
        'javascript',
        'typescript',
      }
      require('nvim-treesitter').install(ensure_installed)

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('kickstart-treesitter', { clear = true }),
        callback = function(args)
          local buf, ft = args.buf, args.match
          local lang = vim.treesitter.language.get_lang(ft)
          if not lang then
            return
          end

          -- Autoinstall languages that are not installed
          if not vim.tbl_contains(require('nvim-treesitter').get_installed(), lang) then
            if vim.tbl_contains(require('nvim-treesitter').get_available(), lang) then
              require('nvim-treesitter').install(lang)
            end
            return
          end

          if not pcall(vim.treesitter.start, buf, lang) then
            return
          end
          -- Ruby depends on vim's regex highlighting system for indent rules.
          if ft ~= 'ruby' then
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
-- vim: ts=2 sts=2 sw=2 et
