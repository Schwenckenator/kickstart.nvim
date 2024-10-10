-- Highlighted comments
-- TODO
-- NOTE
-- HACK
-- WARN
-- FIX
-- PERF
-- TEST
--
-- Comment highlighting
return {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlighting (vim regex)
      keyword = 'bg',
    },
    search = {
      -- regex that will be used to match keywords.
      -- don't replace the (KEYWORDS) placeholder
      pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    },
  },
}
