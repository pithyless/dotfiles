let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 2  " nearest .git, .hg, .svn
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files', 'find %s -type f']
let g:ctrlp_match_window_bottom = 0  " show window on top
let g:ctrlp_max_height = 20
