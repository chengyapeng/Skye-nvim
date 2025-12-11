return {

-- lualine.nvim 底部状态栏配置
{
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    opts = {
        options = {
            theme = "catppuccin",
            always_divide_middle = false,
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { "filename" },
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = { "encoding", "fileformat", "filetype", "progress" },
            lualine_z = { "location" },
        },
        inactive_winbar = {
            -- Always show winbar
            lualine_b = { function() return " " end },
        },
    },
    config = function(_, opts)
        local mocha = require("catppuccin.palettes").get_palette("mocha")

        local function show_macro_recording()
            local recording_register = vim.fn.reg_recording()
            if recording_register == "" then
                return ""
            else
                return "󰑋 " .. recording_register
            end
        end

        local macro_recording = {
            show_macro_recording,
            color = { fg = "#333333", bg = mocha.red },
            separator = { left = "", right = "" },
            padding = 0,
        }

        table.insert(opts.sections.lualine_x, 1, macro_recording)

        require("lualine").setup(opts)
    end
},

-- 顶部状态栏配置
{
    'romgrk/barbar.nvim',
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    lazy = false,
    keys = {
        { "<A-1>", "<CMD>BufferGoto 1<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 1"    },
        { "<A-2>", "<CMD>BufferGoto 2<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 2"    },
        { "<A-3>", "<CMD>BufferGoto 3<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 3"    },
        { "<A-4>", "<CMD>BufferGoto 4<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 4"    },
        { "<A-5>", "<CMD>BufferGoto 5<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 5"    },
        { "<A-6>", "<CMD>BufferGoto 6<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 6"    },
        { "<A-7>", "<CMD>BufferGoto 7<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 7"    },
        { "<A-8>", "<CMD>BufferGoto 8<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 8"    },
        { "<A-9>", "<CMD>BufferGoto 9<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 9"    },

        { "H",     "<CMD>BufferPrevious<CR>",     mode = {"n"}, desc = "[Buffer] Previous buffer"   },
        { "L",     "<CMD>BufferNext<CR>",         mode = {"n"}, desc = "[Buffer] Next buffer"       },

        { "<A-w>", "<CMD>BufferClose<CR>",        mode = {"n"}, desc = "Close buffer"               },
    },
    opts = {
        animation = true,
        -- Automatically hide the tabline when there are this many buffers left.
        -- Set to any value >=0 to enable.
        auto_hide = 1,

        -- Set the filetypes which barbar will offset itself for
        sidebar_filetypes = {
            NvimTree = true, -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
        },
    },
},

-- 目录配置
{
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>e", "<CMD>NvimTreeToggle<CR>", mode = {"n"}, desc = "[NvimTree] Toggle NvimTree" },
    },
    opts = {}
},

-- 匹配不同括号的颜色
{
    "HiPhish/rainbow-delimiters.nvim",
    main = "rainbow-delimiters.setup",
    submodules = false,
    opts = {}
},

-- 配置更好看的消息界面和弹出式菜单
{
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        {"rcarriga/nvim-notify", opts = {background_colour = "#000000"}}
    },
    keys = {
        { "<leader>sN", "<CMD>Noice pick<CR>", desc = "[Noice] Pick history messages" }, -- FIXME: Currently unusable
        { "<leader>N", "<CMD>Noice<CR>", desc = "[Noice] Show history messages" },
    },

    opts = {
        popupmenu = {
            enabled = false,
        },
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
        },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = false, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        routes = {
            -- Hide search count
            { filter = { event = "msg_show", kind = "search_count", }, opts = { skip = true }, },
            -- Hide written message
            { filter = { event = "msg_show", kind = "", }, opts = { skip = true }, },
        },
    }
},

-- 添加 which-key.nvim 插件
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

}
