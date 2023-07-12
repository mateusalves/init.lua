-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.x',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup()
            vim.cmd('colorscheme rose-pine')
        end
    })
    use 'catppuccin/nvim'

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use("nvim-treesitter/nvim-treesitter-context");
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional

            -- Useful plugin to show you pending keybinds.
            { 'folke/which-key.nvim', opts = {} },
        }
    }
    use 'APZelos/blamer.nvim'
    use 'ntpeters/vim-better-whitespace'
    use 'voldikss/vim-floaterm'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- not sure if I'll continue use these ones
    use 'preservim/nerdtree'
    use 'preservim/nerdcommenter'
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-rhubarb'
    use 'tpope/vim-sleuth'

    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    use{
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
   }

    -- Add custom plugins to packer from /nvim/lua/custom/plugins.lua
    local has_plugins, plugins = pcall(require, 'custom.plugins')
    if has_plugins then
        plugins(use)
    end
    if is_bootstrap then
        require('packer').sync()
    end
end)

-- When we are bootsttrapping a configuration, it doesnt't make sense to execute
-- the rest of the init.lua
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '====================================='
    print '     Plugins are being installed     '
    print '     Wait until Packer completes,    '
    print '         then restart nvim           '
    print '====================================='
end

-- Automatically source and re-compile packer whenever you save this init.lua
--local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true})
--vim.api.nvim_create_autocmd('BufWritePost', {
    --commmand = 'source <afile> | PackerCompile',
    --group = packer_group,
    --pattern = vim.fn.expand '$MYVIMRC',
--})
