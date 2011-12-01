if !exists(':Tabularize')
  finish " Tabular.vim wasn't loaded
endif

let s:save_cpo = &cpo
set cpo&vim

AddTabularPattern!  hash  /=>/
AddTabularPattern!  symbols  /:[A-Za-z0-9_-]\+/

AddTabularPipeline! commas /,/ tabular#TabularizeStrings(a:lines, ',', 'l0') | 
                             \ map(a:lines, 'substitute(v:val, ''\( *\),'', '',\1 '', "g")')
let &cpo = s:save_cpo
unlet s:save_cpo
