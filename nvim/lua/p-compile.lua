vim.cmd([[
  map <leader>z :call CompileRun()<CR>
  vmap <leader>z :call CompileRun()<CR>

  func! CompileRun()
      exec "w"
      if &filetype == 'c'
          exec "!gcc % -o %<"
          exec "!time ./%<"
      elseif &filetype == 'cpp'
          exec "!g++ -std=c++17 % -o %<"
          exec "!time ./%<"
      elseif &filetype == 'java'
          exec "!javac %"
          exec "!time java %"
      elseif &filetype == 'sh'
          exec "!time bash %"
      elseif &filetype == 'python'
          exec "!time python3 %"
      elseif &filetype == 'html'
          exec "!google-chrome % &"
      elseif &filetype == 'go'
          exec "!go build %<"
          exec "!time go run %"
      elseif &filetype == 'rust'
          exec "!cargo run"
      endif
  endfunc
]])
