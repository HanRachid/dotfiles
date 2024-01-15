require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

-- Map Ctrl + Z to undo in insert mode
vim.api.nvim_set_keymap("i", "<C-Z>", "<C-O>u", { noremap = true, silent = true })

-- Map Ctrl + Y to redo in insert mode

vim.api.nvim_set_keymap("i", "<C-Y>", "<C-O><C-R>", { noremap = true, silent = true })

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

if vim.g.neovide then
  vim.opt.guifont = "FiraCode Nerd Font:h4"
  vim.g.neovide_hide_mouse_when_typing = true
  -- etc
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"
