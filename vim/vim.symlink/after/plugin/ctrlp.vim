let g:ctrlp_map = '<Leader>,'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 2  " nearest .git, .hg, .svn
let g:ctrlp_match_window_bottom = 0   " show window on top
let g:ctrlp_match_window_reversed = 0 " sort top to bottom
let g:ctrlp_max_height = 20

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files && git ls-files --others --exclude-standard']

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ }

nmap <leader>. :CtrlPClearCache<cr>:CtrlP<cr>
nmap <leader>, :CtrlPMixed<cr>
