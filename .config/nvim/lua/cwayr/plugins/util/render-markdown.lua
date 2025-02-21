return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies =
  {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  },
  opts = {},
  require('render-markdown').setup({
    enabled = true, -- always render from the start
    render_modes = true, -- render in all modes including insert
    code = {
        enabled = true,
        render_modes = false,
        sign = true,
        style = 'full',
        position = 'left',
        language_pad = 0,
        language_name = true,
        disable_background = { 'diff' },
        width = 'full',
        border = 'thin',
        above = '▄',
        below = '▀',
        highlight = 'RenderMarkdownCode',
        highlight_language = nil,
        inline_pad = 0,
        highlight_inline = 'RenderMarkdownCodeInline',
    },
  })
}
