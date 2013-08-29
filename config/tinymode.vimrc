" ウィンドウ簡単リサイズ (like tmux)
func s:CustomResize(offset, vertical)
	let curwindow = winnr()

	" if bottommost window, resize window just above, otherwise current window
	exec 'wincmd '.(a:vertical ? 'h' : 'j')
	if winnr() == curwindow
		exec 'wincmd '.(a:vertical ? 'l' : 'k')
	else
		wincmd p
	endif

	let resize_command = (a:vertical ? 'vertical resize' : 'resize')
	exec resize_command.printf(' %+d', a:offset)

	" restore current window
	exec curwindow.'wincmd w'
endfunc

func VerticalCustomResize(offset)
	call s:CustomResize(a:offset, 1)
endfun

func HorizonCustomResize(offset)
	call s:CustomResize(a:offset, 0)
endfun

call tinymode#EnterMap('winsize', '<C-W><C-j>', '<C-j>')
call tinymode#EnterMap('winsize', '<C-W><C-k>', '<C-k>')
call tinymode#EnterMap('winsize', '<C-W><C-h>', '<C-h>')
call tinymode#EnterMap('winsize', '<C-W><C-l>', '<C-l>')
call tinymode#Map('winsize', '<C-j>', ':call HorizonCustomResize(+2)')
call tinymode#Map('winsize', '<C-k>', ':call HorizonCustomResize(-2)')
call tinymode#Map('winsize', '<C-h>', ':call VerticalCustomResize(+5)')
call tinymode#Map('winsize', '<C-l>', ':call VerticalCustomResize(-5)')
call tinymode#ModeMsg("winsize", "window resizing with C-hjkl")
