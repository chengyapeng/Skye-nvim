-- 代码补全插件，使用 mason.nvim 和 nvim-lspconfig 插件
return {
-- mason.nvim 插件
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },

{
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp', "williamboman/mason.nvim" },

 -- example calling setup directly for each LSP
  config = function()

    -- 改变了 ui 形式，如：报错出现在了代码后方
    vim.diagnostic.config({
        underline = true,
        signs = true,
        update_in_insert = false,
        virtual_text = { spacing = 2, prefix = "●" },
        severity_sort = true,
        float = {
          border = "rounded",
        },
    })

    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local lspconfig = require('lspconfig')

    lspconfig['lua_ls'].setup({ capabilities = capabilities })

    -- 使用 LspAttach 自动命令来映射下面的快捷键
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        vim.keymap.set("n", "K", vim.lsp.buf.hover) -- K 映射为解释当前光标所在的方法意思 -- configured in "nvim-ufo" plugin
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {   -- <leader>d 表示弹出一个信息栏，显示当前行的所有错误信息
          buffer = ev.buf,
          desc = "[LSP] Show diagnostic",
        })
        vim.keymap.set("n", "<leader>gk", vim.lsp.buf.signature_help, { desc = "[LSP] Signature help" })
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "[LSP] Add workspace folder" })
        vim.keymap.set(
          "n",
          "<leader>wr",
          vim.lsp.buf.remove_workspace_folder,
          { desc = "[LSP] Remove workspace folder" }
        )
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, { desc = "[LSP] List workspace folders" })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[LSP] Rename" })
      end,
    })

  end
}

}
