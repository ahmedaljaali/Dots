-------------------------------------------------------------
--Turn off Vim's spell as it highlights the same words
vim.opt.spell = false
-------------------------------------------------------------

-------------------------------------------------------------
--Auto correction
vim.g['spell spelllang']= 'en_us'
-------------------------------------------------------------

-- Enable spelunker.vim. (default: 1)
-- 1: enable
-- 0: disable
vim.g.enable_spelunker_vim = 1

-- Enable spelunker.vim on readonly files or buffer. (default: 0)
-- 1: enable
-- 0: disable
vim.g.enable_spelunker_vim_on_readonly = 0

-- Check spelling for words longer than set characters. (default: 4)
vim.g.spelunker_target_min_char_len = 4

-- Max amount of word suggestions. (default: 15)
vim.g.spelunker_max_suggest_words = 5

-- Max amount of highlighted words in buffer. (default: 100)
vim.g.spelunker_max_hi_words_each_buf = 100

-- Spellcheck type: (default: 1)
-- 1: File is checked for spelling mistakes when opening and saving. This
-- may take a bit of time on large files.
-- 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
-- depends on the setting of CursorHold `set updatetime=1000`.
vim.g.spelunker_check_type = 1

-- Highlight type: (default: 1)
-- 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
-- 2: Highlight only SpellBad.
-- FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
vim.g.spelunker_highlight_type = 1

-- Option to disable word checking.
-- Disable URI checking. (default: 0)
vim.g.spelunker_disable_uri_checking = 1

-- Disable email-like words checking. (default: 0)
vim.g.spelunker_disable_email_checking = 1

-- Disable account name checking, e.g. @foobar, foobar@. (default: 0)
-- NOTE: Spell checking is also disabled for JAVA annotations.
vim.g.spelunker_disable_account_name_checking = 1

-- Disable acronym checking. (default: 0)
vim.g.spelunker_disable_acronym_checking = 1

-- Disable checking words in backtick/backquote. (default: 0)
vim.g.spelunker_disable_backquoted_checking = 1

-- Disable default autogroup. (default: 0)
vim.g.spelunker_disable_auto_group = 1

-- Override highlight setting.
vim.cmd(
[[
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE
]])
