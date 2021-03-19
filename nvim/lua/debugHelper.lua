-- local program = '${rootDir}/node_modules/bin/jest'
-- local program = HOME .. '/.nvm/versions/node/v12.16.3/bin/ts-jest'
local HOME = os.getenv('HOME')
local program = '/node_modules/ts-jest'

local dap = require('dap')

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {HOME .. '/vscode-node-debug2/out/src/nodeDebug.js'},
}

vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})

function debugJest(testName, filename)
  print("starting " .. testName .. " with file " .. filename)
  dap.run({
      type = 'node2',
      request = 'launch',
      cwd = vim.fn.getcwd(),
      runtimeArgs = {'--inspect-brk', '/usr/local/bin/ts-jest', '--no-coverage', '-t', testName, '--', filename},
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = {'<node_internals>/**/*.js'},
      console = 'integratedTerminal',
      port = 9229,
      })
end

function debugNX(testName, filename)
  print("starting " .. testName .. " with file " .. filename)
  dap.run({
      type = 'node2',
      request = 'launch',
      cwd = vim.fn.getcwd(),
      runtimeArgs = {'--inspect-brk', '/usr/local/bin/ts-jest', '--no-coverage', '-t', testName, '--', filename},
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = {'<node_internals>/**/*.js'},
      console = 'integratedTerminal',
      port = 9229,
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
  attach = attach,
}
