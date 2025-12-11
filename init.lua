vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

----------------------------------------------------- Skye 配置 -----------------------------------------------------
vim.opt.list = true 		-- 显示不可见字符
vim.opt.listchars = { tab = ">-", trail = "-" }		-- TAB 和 空格 键的显示

vim.opt.number = true           -- 显示 行号
vim.wo.cursorline = true        -- 显示当前光标所在的行
vim.o.relativenumber = true     -- 启动相对行号

vim.opt.ignorecase = true   -- 忽略大小写
vim.opt.smartcase = true    -- 启用智能大小写匹配，当搜索大写时，就不忽略大小写
vim.opt.hlsearch = false     -- 是否高亮所有匹配的搜索结果

vim.opt.scrolloff = 10      -- 不接触上顶部和下底部
vim.opt.startofline = false -- 是否 行之间移动保持列的位置

vim.wo.wrap = false     -- 内容太长时是否折行

-- tab 相关的配置
vim.opt.softtabstop = 4     -- 一个 tab 相当于两个空格
vim.opt.shiftwidth = 4      -- >> << 等命令移动两个空格
vim.opt.expandtab = true    -- 设置 tab 键插入的是 空格
vim.opt.smartindent = true  -- 开启语法的智能缩进

-- 默认新的分屏窗口在右侧打开
vim.opt.splitbelow = true
vim.opt.splitright = true
                                                ----------- 加载配置文件 -----------
-- 读取 ~/.comfig/nvim/lua/config/lazy.lua 文件内容
require("config.lazy")

require("custom.keymapping")
require("custom.lsp")
