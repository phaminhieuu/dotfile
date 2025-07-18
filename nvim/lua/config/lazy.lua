local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Ignore vim.deprecated
vim.deprecate = function() end

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = true, notify = false },
  change_detection = {
    notify = false,
  },
  ui = {
    border = "rounded",
  },
})

vim.cmd([[colorscheme solarized-osaka]])
