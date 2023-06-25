local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "awk",
    "bash",
    "dockerfile",
    "dot",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "hcl",
    "jq",
    "json",
    "latex",
    "python",
    "r",
    "regex",
    "sql",
    "yaml"
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    "ansible-language-server",
    "awk-language-server",
    "bash-language-server",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "dot-language-server",
    "jq-lsp",
    "json-lsp",
    "marksman",
    "sqlls",
    "terraform-ls",
    "texlab",
    "yaml-language-server",
    "pyright",
    "ansible-lint",
    "gitlint",
    "jsonlint",
    "markdownlint",
    "sqlfluff",
    "yamllint",
    "black"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
