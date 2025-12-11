                               ----------------------- 键盘映射 -----------------------
-- <CMD> 等价于 ':'
-- <CR> 等价于 'Enter'
-- 注：<leader> 和 <localleader> 键的映射在 ~/.config/nvim/lua/config/lazy.nvim 文件中
vim.keymap.set("i", "jk", "<ESC>", { desc = " 将 jk 映射为 esc " })
vim.keymap.set("n", "<leader>w", "<CMD>w<CR>", { desc = " 将 <leader>w 映射为 :w 保存 " })
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>", { desc = " 将 <leader>q 映射为 :q 退出 " })

-- 目录 和 分屏 时可以来回切换
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above window" })

-- vim.keymap.set("n", "<leader>L", "<CMD>Lazy<CR>", { desc = "[Lazy] Open Lazy.nvim" })  -- 快捷键，使 <leader>L 映射为 :Lazy
