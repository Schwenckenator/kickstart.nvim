require('typescript-tools').setup {
  settings = {
    tsserver_file_preferences = {
      includeInlayParameterNameHints = 'all',
    },
  },
}
