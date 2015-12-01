"
" Load Settings
"
function! s:source_lazy(name, path)
	let bundle = neobundle#get(a:name)
	execute join([
		\ 'function! bundle.hooks.on_post_source(bundle)',
		\ '	source ' . a:path,
		\ 'endfunction',
		\ ], "\n")
endfunction

function! s:plugin_setting_path(bundle_name)
	return expand('~/dotfiles/vimrc/plugins/' . a:bundle_name . '.vimrc')
endfunction

" Based on https://github.com/Genki-S/dotfiles/blob/fd02273b3a9ecdee9bb24f4a79b0989dcb49b995/vimfiles/vim/neobundle.vim#L77-L83
function! s:source_all_plugin_settings()
	let s:bundle_names = map(neobundle#config#get_neobundles(), 'v:val["name"]')
	for bundle_name in s:bundle_names
		let s:path = s:plugin_setting_path(bundle_name)
		if filereadable(s:path)
			call s:source_lazy(bundle_name, s:path)
		endif
	endfor
endfunction

call s:source_all_plugin_settings()
