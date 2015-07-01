" vim-minimap
nnoremap [minimap] <Nop>
nmap <Leader>m [minimap]

nnoremap <silent> [minimap]m :call ShowOrReloadMinimap()<CR>
nnoremap <silent> [minimap]k :call CloseMinimap()<CR>

autocmd CursorMoved * if exists("g:minimaped") | call ReloadMinimap() | endif

" functions
function! ShowOrReloadMinimap()
python << EOF
import vim

if FindMinimap():
  vim.command("let g:minimaped = 1")
  vim.command("call ReloadMinimap()")
else:
  vim.command("let g:minimaped = 1")
  vim.command("Minimap")
EOF
endfunction

function! ReloadMinimap()
python << EOF
import vim

WIDTH = 20
HORIZ_SCALE = 0.1

minimap = FindMinimap()
if minimap:
  src = vim.current.window
  cursor = src.cursor

  vim.command("normal H")
  topline = src.cursor[0]
  vim.command("normal L")
  bottomline = src.cursor[0]

  vim.current.window = minimap

  lengths = []

  for line in range(len(src.buffer)):
      lengths.append(len(src.buffer[line]))

  minimap.buffer[:] = draw(lengths)
  vim.command("match WarningMsg /\%>0v\%<{}v\%>{}l\%<{}l./".format(WIDTH, topline/4, bottomline/4 - 1))

  src.cursor = cursor
  vim.current.window = src
EOF
endfunction

function! CloseMinimap()
python << EOF
import vim

minimap = FindMinimap()
if minimap:
  vim.current.window = minimap
  vim.command("quit")
  vim.command("unlet g:minimaped")
EOF
endfunction

python << EOF
def FindMinimap():
  import vim

  MINIMAP = "vim-minimap"

  minimap = None

  for b in vim.buffers:
      if b.name.endswith(MINIMAP):
          for w in vim.windows:
              if w.buffer == b:
                  minimap = w

  return minimap
EOF
