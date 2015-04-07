" for RSpec
let g:quickrun_config = { '*': { 'runner': 'vimproc' } }
let g:quickrun_config['ruby.rspec'] = { 'type': 'rspec/bundle', 'command': 'rspec', 'cmdopt': '-l%{line(".")}', 'exec': 'bundle exec %c %o %s', 'outputter': 'buffer:filetype=rspec-result' }
augroup RSpec
	autocmd!
	autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END
