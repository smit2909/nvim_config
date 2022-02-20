-- set packpath
local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

-- basic settings
require('sets')
require('plugins')
require('augroups')
-- setup plugins
require("setup_plugins")
-- setup keymaps
require("keymaps")
