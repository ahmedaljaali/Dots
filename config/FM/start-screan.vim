"""""""""""""""""""""""""""""""""""""""""""""""""""""
"Where to put my sessions
let g:startify_session_dir = '~/.config/nvim/session'
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"List
let g:startify_lists = [
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"Bookmarks
let g:startify_bookmarks = [
            \ { 'a': '~/.config/nvim/init.vim' },
            \ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"auto load sessions
let g:startify_session_autoload = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"Take care of buffers
let g:startify_session_delete_buffers = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"Similar to Vim-rooter
let g:startify_change_to_vcs_root = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"If you want Unicode
let g:startify_fortune_use_unicode = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"Automatically Update sessions
let g:startify_session_persistence = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get rid of empy buffer and quit
let g:startify_enable_special = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"custom header
let g:startify_custom_header = [
      \'         o                                              o            o              ',
      \'        <|>                                            <|>         _<|>_            ',
      \'        / \                                            / >                          ',
      \'      o/   \o        o__ __o/     o__ __o/      __o__  \o__ __o      o    \o__ __o  ',
      \'     <|__ __|>      /v     |     /v     |      />  \    |     v\    <|>    |     |> ',
      \'     /       \     />     / \   />     / \     \o      / \     <\   / \   / \   < > ',
      \'   o/         \o   \      \o/   \      \o/      v\     \o/     o/   \o/   \o/       ',
      \'  /v           v\   o      |     o      |        <\     |     <|     |     |        ',
      \' />             <\  <\__  < >    <\__  / \  _\o__</    / \    / \   / \   / \       ',
      \'                           |                                                        ',
      \'                           o                                                        ',
      \'                           <\__                                                     ',
      \]

"""""""""""""""""""""""""""""""""""""""""""""""""""""
