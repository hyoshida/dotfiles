setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab

if !exists('b:undo_indent')
  let b:undo_indent = ''
endif
let b:undo_indent .= '| setlocal '.join([
\   'shiftwidth<',
\   'softtabstop<',
\ ])
