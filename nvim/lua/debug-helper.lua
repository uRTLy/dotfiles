require("nvim-dap-virtual-text").setup()
require("dapui").setup()

local HOME = os.getenv('HOME')
local dap = require('dap')

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {HOME .. '/vscode-node-debug2/out/src/nodeDebug.js'},
}

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})

vim.g.dap_virtual_text = 'all frames'

dap.adapters.ruby = {
  type = 'executable';
  command = 'bundle';
  args = {'exec', 'readapt', 'stdio'};
}


dap.configurations.ruby = {
  {
    type = 'ruby';
    request = 'launch';
    name = 'Rails';
    program = 'bundle';
    programArgs = {'exec', 'rails', 's'};
    useBundler = true;
    console = 'integratedTerminal';
  },
}

-- dap.configurations.node = {
--   {
--       name = 'Jest',
--       type = 'node2',
--       request = 'launch',
--       cwd = '${workspaceFolder}',
--       program = '${workspaceFolder}/node_modules/.bin/jest',
--       args = {
--       '--testPathPattern',
--       '${file}', 
--       '--runInBand',
--       },
--       sourceMaps = true,
--       console = 'integratedTerminal',
--       skipFiles = {'<node_internals>/**/*.js'},
-- }
-- }


function debugJest(testName, filename)
  dap.run({
      type = 'node2',
      request = 'launch',
      cwd = '${workspaceFolder}',
      program = '${workspaceFolder}/node_modules/.bin/jest',
      args = {
      '--testPathPattern',
      filename, 
      '-t',
      testName,
      '--runInBand',
      },
      sourceMaps = true,
      console = 'integratedTerminal',
      skipFiles = {'<node_internals>/**/*.js'},
      })
end

function debugNX()
  dap.run({
      type = 'node2',
      request = 'launch',
      cwd = '${workspaceFolder}',
      program = '${workspaceFolder}/node_modules/.bin/jest',
      args = {
      '--testPathPattern',
      '${file}',
      '--runInBand',
      },
      sourceMaps = true,
      console = 'integratedTerminal',
      skipFiles = {'<node_internals>/**/*.js'},
      })
end



local api = vim.api
local keymap_restore = {}
dap.listeners.after['event_initialized']['me'] = function()
  for _, buf in pairs(api.nvim_list_bufs()) do
    local keymaps = api.nvim_buf_get_keymap(buf, 'n')
    for _, keymap in pairs(keymaps) do
      if keymap.lhs == "I" then
        table.insert(keymap_restore, keymap)
        api.nvim_buf_del_keymap(buf, 'n', 'I')
      end
    end
  end
  api.nvim_set_keymap(
    'n', 'I', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
end

 -- local widgets = require('dap.ui.widgets')
 -- widgets.centered_float(widgets.scopes)



dap.listeners.after['event_terminated']['me'] = function()
  for _, keymap in pairs(keymap_restore) do
    api.nvim_buf_set_keymap(
      keymap.buffer,
      keymap.mode,
      keymap.lhs,
      keymap.rhs,
      { silent = keymap.silent == 1 }
    )
  end
  keymap_restore = {}
end


return {
  debugJest = debugJest,
  debugNX = debugNX,
  debugNodeApp = debugNodeApp,
  attach = attach,
}
