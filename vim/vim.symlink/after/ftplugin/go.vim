" Go Lang

set makeprg=gb
set errorformat=%D(in\ %.%#)\ building\ pkg\ \”%f\”,%f:%l:\ %m%.%#,%-G%.%#

set tabstop=8
set shiftwidth=8
set softtabstop=8
set noexpandtab

set rtp+=$GOROOT/misc/vim

autocmd BufWritePre *.go :silent Fmt

setlocal omnifunc=gocomplete#Complete
