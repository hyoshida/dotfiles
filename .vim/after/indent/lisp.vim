"setlocal softtabstop=4
"setlocal shiftwidth=4
setlocal expandtab

if !exists('b:undo_indent')
  let b:undo_indent = ''
endif
let b:undo_indent .= '| setlocal '.join([
\   'shiftwidth<',
\   'softtabstop<',
\ ])
