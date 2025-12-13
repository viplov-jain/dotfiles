local css_config = {
  css_fn = true,
}

require('colorizer').setup {
  filetypes = {
    scss = css_config,
    css = css_config,
    yuck = css_config,
    'javascript',
    'toml',
    html = { names = false },
  },
}
