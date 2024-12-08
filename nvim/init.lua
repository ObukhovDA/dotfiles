local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- стабильная версия
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Список ваших плагинов
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvimdev/dashboard-nvim" },
  { "folke/persistence.nvim" },
  { "nvim-neorg/neorg" },
  { "stevearc/oil.nvim" },
  { "ellisonleao/gruvbox.nvim", priority = 1000 }, -- Gruvbox
  { "folke/tokyonight.nvim" }, -- Пример темы
})

local version = vim.version()
local header = {
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀",
"⠰⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠆",
"⠀⢻⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⡟⠀",
"⠀⠀⠻⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⠟⠀⠀",
"⠀⠀⠀⠙⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⣰⣆⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⠋⠀⠀⠀",
"⠀⠀⠀⠀⠈⠻⣿⡿⠋⠀⠀⠀⠀⣠⣾⣿⣿⣷⣄⠀⠀⠀⠀⠙⢿⣿⠟⠁⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡎⢿⣿⣿⣿⣿⡿⢱⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⣤⣶⣾⣿⣿⣿⣦⢻⣿⣿⡟⣴⣿⣿⣿⣷⣶⣤⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⡇⣿⣿⢸⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⡀⢀⠀⠀⢠⢟⣼⣿⣿⣿⣿⣿⢰⣿⣿⡆⣿⣿⣿⣿⣿⣧⡻⡄⠀⠀⡀⢀⠀⠀",
"⠀⠀⣇⢌⢦⣺⣿⠻⢿⣿⣿⡿⠟⢋⢸⣿⣿⡇⡙⠻⢿⣿⣿⡿⠟⣿⣗⡴⡡⣸⠀⠀",
"⠀⠀⠸⡧⢙⣿⣟⠀⣴⣶⠒⠲⣦⠘⠲⣭⣭⠖⠃⣴⠖⠒⣶⣦⠀⣻⣿⡋⢼⡇⠀⠀",
"⠀⠀⠀⣷⡈⣿⣿⣶⣜⡻⠦⠴⠟⠠⣷⣹⣏⣾⠄⠻⠦⠴⢟⣣⣶⣿⣿⢁⣾⠀⠀⠀",
"⠀⠀⠀⠻⣷⢹⣿⣿⣿⣿⣷⣤⣸⣿⣌⢿⡿⣡⣿⣇⣤⣾⣿⣿⣿⣿⣏⣾⠟⠀⠀⠀",
"⠀⠀⠀⠀⣾⣷⣝⡻⢿⣿⣿⡟⠉⣭⣿⣼⣧⣿⣭⠉⢻⣿⣿⡿⢟⣫⣾⣷⠀⠀⠀⠀",
"⠀⠀⠀⠀⢿⣿⣿⠏⠀⠝⣛⣃⣧⣝⣻⠿⠿⣟⣫⣼⣘⣛⠫⠀⠹⣿⣿⡿⠀⠀⠀⠀",
"⠀⠀⠀⠀⠈⠋⢿⡀⠃⣤⡌⠛⠿⠟⠛⠻⠟⠛⠻⠿⠛⢡⣤⠘⢀⡿⠙⠁⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠈⠻⢠⡿⢁⡀⣶⣶⣤⡤⢤⣤⣶⣶⢀⡈⢿⡄⠟⠁⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠜⢴⡄⠈⠻⢟⣷⡾⢷⣾⡻⠟⠁⢠⡦⠣⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⡄⣦⣈⢀⠀⠀⡀⣁⣴⢠⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⣒⣒⡵⣛⣛⢮⣒⣒⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"❯❯❯  N e o v i m   V." .. version.major .. "." .. version.minor .. "  ❮❮❮",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}

local center = {
  {
    icon = ' ',
    icon_hl = 'Title',
    desc = 'New file',
    desc_hl = 'String',
    key = 'n',
    keymap = '',
    key_hl = 'Number',
    key_format = ' %s',
    action = 'ene'
  },
  {
    icon = ' ',
    icon_hl = 'Title',
    desc = 'Recent files',
    desc_hl = 'String',
    key = 'r',
    keymap = '',
    key_hl = 'Number',
    key_format = ' %s',
    action = 'Telescope oldfiles'
  },
  {
    icon = ' ',
    icon_hl = 'Title',
    desc = 'Update',
    desc_hl = 'String',
    key = 'u',
    keymap = '',
    key_hl = 'Number',
    key_format = ' %s',
    action = 'Lazy sync'
  },
  {
    icon = ' ',
    icon_hl = 'Title',
    desc = 'Quit',
    desc_hl = 'String',
    key = 'q',
    keymap = '',
    key_hl = 'Number',
    key_format = ' %s',
    action = 'q'
  },
}

-- Настройка Gruvbox с чёрным фоном
vim.o.background = "dark" -- Устанавливаем тёмный режим
require("gruvbox").setup({
  contrast = "hard", -- Высокий контраст
  palette_overrides = {
    dark0_hard = "#000000", -- Чёрный фон
  },
  overrides = {
    Normal = { bg = "#000000" }, -- Задаём фон вручную
  },
})
vim.cmd("colorscheme gruvbox") -- Применяем тему

require('dashboard').setup({
  theme = 'doom',
  config = {
    header = header,
    center = center,
    footer = function()
      return {
        "─── "..os.date("%a, %d / %m / %Y").." ───",
	"⊙ Welcome back bitch! ⊙"
      }
    end
  },
})
