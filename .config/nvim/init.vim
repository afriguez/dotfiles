call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'

Plug 'preservim/nerdtree'

call plug#end()

map <C-n> :NERDTreeToggle<CR>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

nnoremap <C-p> :GFiles<CR>
nnoremap <C-T> :Files<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>s :BLines<cr>

nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

nnoremap <leader>gc :GCheckout<CR>

nnoremap gp :call CocAction('runCommand', 'prettier.formatFile')<CR>

" Set relative number
set relativenumber
