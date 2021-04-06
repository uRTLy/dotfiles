local HOME = os.getenv('HOME')
local dap = require('dap')

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {HOME .. '/vscode-node-debug2/out/src/nodeDebug.js'},
}

vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
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

dap.configurations.node = {
  {
      name = 'Jest',
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
}
}


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


function debugNodeApp()
  print("starting node app")
  dap.run({
      type = 'node2',
      port = 9229,
      request = 'attach',
      name = 'Debug medondo server',
      console = 'integratedTerminal',
      restart = true,
      sourceMaps = true,
      protocol = 'inspector',
      localRoot = '${workspaceFolder}/dist',
      remoteRoot = '/home/node/app/dist',
      cwd = '${workspaceFolder}/dist',
      skipFiles = {'<node_internals>/**/*.js'},
      outFiles = { "${workspaceFolder}/dist/**/*.js"}
      })
end

local function attach()
  print("attaching")
  dap.run({
      type = 'node2',
      request = 'attach',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = {'<node_internals>/**/*.js'},
      })
end

return {
  debugJest = debugJest,
  debugNX = debugNX,
  debugNodeApp = debugNodeApp,
  attach = attach,
}
