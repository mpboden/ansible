return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "bash", 
                "c", 
                "cpp", 
                "html", 
                "css", 
                "yaml", 
                "lua", 
                "vim", 
                "vimdoc", 
                "query", 
                "javascript",
            },
            sync_install = false,
            auto_install = true,
            highlight = { 
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },  
        })
    end
}
