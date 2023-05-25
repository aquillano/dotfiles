require('aquillano.base')
require('aquillano.keymaps')
require('aquillano.plugins')

local has = vim.fn.has
local is_mac = has "macunix"

if is_mac then
  require('aquillano.macos')
end