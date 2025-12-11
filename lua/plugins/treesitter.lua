return {

{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          auto_install = true,
          ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "markdown_inline"   -- lsp 需要这用这个语言显示代码信息
            },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
}

}
