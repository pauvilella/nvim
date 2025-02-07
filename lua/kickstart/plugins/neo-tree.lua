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
  cmd = 'Neotree',
  keys = {
    -- [PVS]: Change the keymap to <leader>ñ because it's easier in ISO ES keyboard layout
    { '<leader>ñ', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        -- [PVS]: Add autoexpand to match filename length
        auto_expand_width = true,
        mappings = {
          -- [PVS]: Change keymap to <leader>ñ.
          ['<leader>ñ'] = 'close_window',
        },
      },
    },
  },
}
