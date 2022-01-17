"==============================================================================
"
" Author:       Matthew Bennett
" Version:      1.0.0
" License:      Same as Vim's (see :help license)
"
"
"==============================================================================


"================================== SETUP =====================================

""{{{---------------------------------------------------------------------------
"if exists("g:unit_test") || &cp || v:version < 700
"    finish
"endif
"let g:unit_test = 1
""}}}---------------------------------------------------------------------------
""

function! Open_new_test_buffer(test_id)
    execute 'vsplit test_'.string(a:test_id)
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal nobuflisted
endfunction

function! Run_command(str)
    execute "normal ".a:str
endfunction

function! Run_before()
    for command in g:before
        echo command
        if len(command) > 0
            call Run_command(command)
        endif
    endfor
endfunction

function! Run_test(test_id)
    call Run_command(g:tests[a:test_id])
endfunction

function! Run_after()
    for command in g:after
        if len(command) > 0
            call Run_command(command)
        endif
    endfor
endfunction

function! Close_test_buffer()
    bwipeout
endfunction

function! Extract_test_result()
    call add(s:results, getline('.'))
endfunction

function! Compare_to_expected(test_id)
    return s:results[a:test_id] =~# g:expected[a:test_id]
endfunction

function! Print_test_results(result, test_id)
    if a:result == 1
        call appendbufline('results.vim', '$', 'Test '.string(a:test_id+1).' Passed!')
    else
        call appendbufline('results.vim', '$', 'Test '.string(a:test_id+1).' Failed')
        call appendbufline('results.vim', '$', '')
        call appendbufline('results.vim', '$', '    Expected: '.g:expected[a:test_id])
        call appendbufline('results.vim', '$', '    Actual  : '.s:results[a:test_id])
    endif
    call appendbufline('results.vim', '$', '')
endfunction

let s:l = 0
let s:results = []
execute 'edit results.vim'
function! Run_tests()
    for test_id in range(len(g:tests))
        if test_id == 0
            source tests.vim
        endif
        call Open_new_test_buffer(test_id)
        call Run_before()
        call Run_test(test_id)
        call Run_after()
        call Extract_test_result()
        call Close_test_buffer()
        let result = Compare_to_expected(test_id)
        call Print_test_results(result, test_id)
    endfor
endfunction

call Run_tests()

