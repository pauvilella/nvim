-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

-- [PVS]: Added this local function to handle copying file names to the clipboard
local function copy_path(state)
  -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
  -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
  local node = state.tree:get_node()
  local filepath = node:get_id()
  local filename = node.name
  local modify = vim.fn.fnamemodify

  local results = {
    filepath,
    modify(filepath, ':.'),
    modify(filepath, ':~'),
    filename,
    modify(filename, ':r'),
    modify(filename, ':e'),
  }

  vim.ui.select({
    '1. Absolute path: ' .. results[1],
    '2. Path relative to CWD: ' .. results[2],
    '3. Path relative to HOME: ' .. results[3],
    '4. Filename: ' .. results[4],
    '5. Filename without extension: ' .. results[5],
    '6. Extension of the filename: ' .. results[6],
  }, { prompt = 'Choose to copy to clipboard:' }, function(choice)
    if choice then
      local i = tonumber(choice:sub(1, 1))
      if i then
        local result = results[i]
        vim.fn.setreg('+', result)
        vim.notify('Copied: ' .. result)
      else
        vim.notify 'Invalid selection'
      end
    else
      vim.notify 'Selection cancelled'
    end
  end)
end

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
          -- [PVS]: Add keymap for copying filenames to keyboard
          ['Y'] = copy_path,
        },
      },
    },
  },
}
