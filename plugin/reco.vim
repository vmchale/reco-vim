if exists('g:__RECO_VIM__')
    finish
endif
let g:__RECO_VIM__ = 1

command! RecoCheck SyntasticCheck reco
map <Plug>RecoCheck :RecoCheck<CR>
