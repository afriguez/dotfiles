set nobackup
set noswapfile
set relativenumber
set number
set tabstop=4 softtabstop=2 shiftwidth=2
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'

Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

nnoremap <C-p> :GFiles<CR>
nnoremap <C-T> :Files<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>s :BLines<cr>

nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nnoremap <leader>gc :GCheckout<CR>
nnoremap <leader>gk :Git commit<CR>

nnoremap go :silent call CocAction('runCommand', 'editor.action.organizeImport')<CR>
nnoremap gp :call CocAction('runCommand', 'prettier.formatFile')<CR>

nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

let g:mkdp_auto_start = 1
let g:mkdp_refresh_slow = 1
let g:airline_theme='violet'

au BufRead,BufNewFile *.ts,*.tsx set filetype=typescriptreact
au BufRead,BufNewFile *.js,*.jsx set filetype=javascriptreact

hi Comment cterm=italic
hi Special cterm=italic
hi Statement cterm=italic
hi Type cterm=bold,italic
