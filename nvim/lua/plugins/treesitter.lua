return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = { 'c', 'lua', 'luadoc', 'elixir', 'heex', 'latex', 'rust', 'python', 'html', 'javascript', 'diff', 'bash', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline'},
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    highlight = {
      enable = true
    },
    -- Indentation based on treesitter for the = operator. NOTE: This is an experimental feature.
    indent = {
      enable = true
    }
  }
}
