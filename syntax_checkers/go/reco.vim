if exists('g:loaded_syntastic_go_reco_checker')
    finish
endif
let g:loaded_syntastic_go_reco_checker = 1

let g:syntastic_go_reco_exec = 'reco'

function! StripANSI(errors) abort " {{{2
   
    let errlist = copy(a:errors)
    let out = []

    for e in a:errors
        call add(out, substitute(e, '\[[0-9;]\+m', '', 'g'))
    endfor

    return out

endfunction " }}}2

function! SyntaxCheckers_go_reco_GetLocList() dict

    let makeprg = self.makeprgBuild({
                \ 'exe': self.getExec(),
                \ 'args': 'check',
                \ 'fname': shellescape(expand('%'))})

    " currently a bit broken.
    let errorformat =
                \ '%E%\e%\eerror[%t%n]%\e:%m%\e,' .
                \ '%Z,' .
                \ '%E%serror[%t%n]%\e:%m%\e,' .
                \ '%C%s    --> %\e%f:%l:%c,' .
                \ '%Z,' .
                \ '%E(unknown position): %m,' .
                \ '%Z,'
    let loclist = SyntasticMake({
            \ 'makeprg': makeprg,
            \ 'errorformat': errorformat,
            \ 'Preprocess': 'StripANSI' })


    return loclist

endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'go',
    \ 'name': 'reco'})
