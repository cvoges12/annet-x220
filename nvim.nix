with import <nixpkgs> {};
                                                                                 
neovim.override {
  configure = {
    customRC = ''
      
      " search.vim
      "set incsearch
      "set hlsearch
      "nnoremap <leader><space> :nohlsearch<CR>
      
      
      " settings.vim
      set nocompatible
      let mapleader =" "
      
      set number relativenumber
      augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
      augroup END
      
      set mouse =""
      
      set statusline+=%#warningmsg#
      set statusline+=%{SyntasticStatuslineFlag()}
      set statusline+=%*
      
      let g:syntastic_always_populate_loc_list = 1
      let g:syntastic_auto_loc_list = 1
      let g:syntastic_check_on_open = 1
      let g:syntastic_check_on_wq = 0
      let g:syntastic_tex_lacheck_quiet_messages = { 'regex': '\Vpossible unwanted space at' }
      " LaTeX
      map <leader>c :w! \| !pdflatex <c-r>%<CR><CR>
	  " autocmd VimLeave *.tex !texclear.sh %
      
      " ui.vim
      set showcmd
      set cursorline
      filetype indent on
      set lazyredraw
      set showmatch
      set laststatus=2
      set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
      " wildmenu
      set wildmenu
      set wildmode=list:longest,full wildmenu
      
      " whitespace.vim
      set tabstop=4
      set softtabstop=4
      set expandtab
                                                                                 
                                                                                 
                                                                                 
  " COLEMAK KEYBINDINGS
  "" REMOVE OR COMMENT OUT IF USE ANOTHER LAYOUT SUCH AS QWERTY
      
      " Up/down/left/right
      nnoremap h h|vnoremap h h|onoremap h h|
      nnoremap n j|vnoremap n j|onoremap n j|
      nnoremap e k|vnoremap e k|onoremap e k|
      nnoremap i l|vnoremap i l|onoremap i l|
      
      " Words/WORDS forward/backward/end
      "" l/L = back word/WORD
      "" u/U = end of word/WORD
      "" y/Y = forward word/WORD
      nnoremap l b|vnoremap l b|onoremap l b|
      nnoremap L B|vnoremap L B|onoremap L B|
      nnoremap u e|vnoremap u e|onoremap u e|
      nnoremap U E|vnoremap U E|onoremap U E|
      nnoremap y w|vnoremap y w|onoremap y w|
      nnoremap Y W|vnoremap Y W|onoremap Y W|
                                                                                 
      " Append/Replace/inSert/change
      "" a/A = append/append at eol
      "" r/R = replace/replace mode
      "" s/S = insert/inSert at eol
      nnoremap s i|
      nnoremap S I|
      "" w/W = change/change to eol
      nnoremap w c|vnoremap w c|onoremap w c|
      nnoremap W C|vnoremap W C|onoremap W C|
                                                                                 
      " Cut/copy/paste
      "" x/X = delete char/backspaces
      "" d/D = delete/delete to eol
      nnoremap c y|vnoremap c y|onoremap c y|
      nnoremap C Y|vnoremap C Y|onoremap C Y|
                                                                                 
      " Undo/redo
      nnoremap z u|xnoremap z :<C-U>undo<CR>|
      nnoremap gz U|xnoremap gz :<C-U>undo<CR>|
      nnoremap Z <C-R>|xnoremap Z :<C-U>redo<CR>|
                                                                                 
      " Visual mode
      "" Make insert/add work also in visual line mode like in visual block mode
      xnoremap <silent> <expr> s (mode() =~# "[V]" ? "\<C-V>0o$I" : "I")
      xnoremap <silent> <expr> S (mode() =~# "[V]" ? "\<C-V>0o$I" : "I")
                                                                                 
      " Goto
      "" ge = visual line up
      "" gn = visual line down
      nnoremap ge gk|vnoremap ge gk|onoremap ge gk|
      nnoremap gn gj|vnoremap gn gj|onoremap gn gj|
                                                                                 
      " Search
      "" f/F = find/back find
      "" t/T = till/back till
      "" ;/, = repeat/reverse
      "" k/K = next/prev
      nnoremap k n|vnoremap k n|onoremap k n|
      nnoremap K N|vnoremap K N|onoremap K N|
                                                                                 
      " Inner text objects
      "" E.g. dip (delete inner paragraph) is now dsp
      onoremap s i
                                                                                 
      " Folds
      nnoremap j z|xnoremap j z|
      nnoremap jn zj|xnoremap jn zj|
      nnoremap je zk|xnoremap je zk|
                                                                                 
      " Help
      nnoremap B K|vnoremap B K|
                                                                                 
      " Window handling
      nnoremap <C-W>h <C-W>h|vnoremap <C-W>h <C-W>h|
      nnoremap <C-W>n <C-W>j|vnoremap <C-W>n <C-W>j|
      nnoremap <C-W>e <C-W>k|vnoremap <C-W>e <C-W>k|
      nnoremap <C-W>i <C-W>l|vnoremap <C-W>i <C-W>l|
                                                                                 
      " Screen/Scroll/Page
      "" H = top screen
      "" M = mid screen
      "" I = bot screen
      nnoremap I L|vnoremap I L|
      "" E = half page up
      "" N = half page down
      nnoremap E <C-U>|vnoremap E <C-U>|
      nnoremap N <C-D>|vnoremap N <C-D>|
      " Split Navigation
      nnoremap <C-h> <C-w>h
      nnoremap <C-n> <C-w>j
      nnoremap <C-e> <C-w>k
      nnoremap <C-i> <C-w>l
                                                                                 
    '';
    packages.myVimPackage = with pkgs.vimPlugins; {
      start = [ idris-vim YouCompleteMe Syntastic ];
      opt = [ vim-latex-live-preview ];
    };
  };
}
