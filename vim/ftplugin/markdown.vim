setlocal spell

highlight htmlItalic cterm=italic
highlight htmlBold cterm=bold

" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/
" https://github.com/pengwynn/dotfiles
highlight TechWordsToAvoid ctermbg=red ctermfg=white
function! MatchTechWordsToAvoid()
  match TechWordsToAvoid /\c\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)/
endfunction
call MatchTechWordsToAvoid()
autocmd BufWinEnter *.md call MatchTechWordsToAvoid()
autocmd InsertEnter *.md call MatchTechWordsToAvoid()
autocmd InsertLeave *.md call MatchTechWordsToAvoid()
autocmd BufWinLeave *.md call clearmatches()
command! -nargs=* Wrap set wrap linebreak nolist

" en and em dashes
inoremap <buffer> --<space> –<space>
inoremap <buffer> ---<space> —<space>
