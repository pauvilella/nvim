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
    -- [PVS]: Change the keymap to | as recommended by neo-tree documentation
    { '|', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    -- [PVS]: Add the following keymaps
    { '<leader>nb', ':Neotree toggle show buffers right<CR>', desc = 'Neotree show open buffers on the right', silent = true },
    { '<leader>ng', ':Neotree float git_status<CR>', desc = 'Neotree show git status', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        -- [PVS]: Add autoexpand to match filename length
        auto_expand_width = true,
        mappings = {
          -- [PVS]: Change the keymap to | as recommended by neo-tree documentation
          ['|'] = 'close_window',
        },
      },
    },
  },
}
