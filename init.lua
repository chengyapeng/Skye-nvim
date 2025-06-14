-- 读取 ~/.comfig/nvim/lua/config/lazy.lua 文件内容
require("config.lazy")

----------------------------------------------------- Skye 配置 -----------------------------------------------------
vim.opt.list = true 		-- 显示不可见字符
vim.opt.listchars = { tab = ">-", trail = "-" }		-- TAB 和 空格 键的显示

vim.opt.number = true     -- 显示 行号
vim.wo.cursorline = true  -- 显示当前光标所在的行

-- tab 相关的配置
vim.opt.softtabstop = 2     -- 一个 tab 相当于两个空格
vim.opt.shiftwidth = 2      -- >> << 等命令移动两个空格
vim.opt.expandtab = true    -- 设置 tab 键插入的是 空格
vim.opt.smartindent = true  -- 开启语法的智能缩进

                               ----------------------- 键盘映射 -----------------------
-- <CMD> 等价于 ':'
-- <CR> 等价于 'Enter'
-- 注：<leader> 和 <localleader> 键的映射在 ~/.config/nvim/lua/config/lazy.nvim 文件中
vim.keymap.set("i", "jk", "<ESC>", { desc = " 将 jk 映射为 esc " })
vim.keymap.set("n", "<leader>w", "<CMD>w<CR>", { desc = " 将 <leader>w 映射为 :w 保存 " })
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>", { desc = " 将 <leader>q 映射为 :q 退出 " })



-- vim.keymap.set("n", "<leader>L", "<CMD>Lazy<CR>", { desc = "[Lazy] Open Lazy.nvim" })  -- 快捷键，使 <leader>L 映射为 :Lazy
