au BufRead,BufNewFile *.gemspec setlocal ft=ruby
au BufRead,BufNewFile *.rb      setlocal ft=ruby
au BufRead,BufNewFile *.ru      setlocal ft=ruby
au BufRead,BufNewFile Gemfile   setlocal ft=ruby
au BufRead,BufNewFile Rakefile  setlocal ft=ruby

au FileType ruby setlocal noet sts=0 sw=2 ts=2
