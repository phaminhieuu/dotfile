return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "astro",
        "css",
        "gitignore",
        "http",
        "sql",
        "glsl",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "dockerfile",
        "markdown",
        "markdown_inline"
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- MDX
      vim.filetype.add({
        extension = {
          mdx = "markdown.mdx",
        },
      })

      vim.filetype.add({
        extension = {
          vs = "glsl",
          fs = "glsl",
        }
      })

      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
