set nobackup
set noswapfile
set relativenumber
set number
set mouse=
set tabstop=4 softtabstop=4 shiftwidth=2

call plug#begin()
" misc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" syntax hi, filetype detection, format
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" interface
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

map <C-n> :NvimTreeToggle<CR>
let g:mix_format_on_save = 1

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

let g:coc_global_extensions = [
	  \ 'coc-prettier',
	  \ 'coc-html',
	  \ 'coc-discord-rpc',
	  \ 'coc-tsserver',
	  \ 'coc-sql',
	  \ 'coc-sh',
	  \ 'coc-python',
	  \ 'coc-go',
	  \ 'coc-elixir',
	  \ 'coc-css' ]

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

let g:mkdp_auto_start = 1
let g:mkdp_refresh_slow = 1
let g:airline_theme='violet'

let g:vim_jsx_pretty_colorful_config = 1

hi Comment cterm=italic
hi Special cterm=italic
hi Statement cterm=italic
hi Type cterm=bold,italic
hi Identifier cterm=italic

lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "extension",
  git = {
	enable = true,
	ignore = false,
  },
  view = {
    adaptive_size = true,
	number = true,
	relativenumber = true,
  },
  renderer = {
    group_empty = true,
	icons = {
	  show = {
		git = true,
	  },
	},
  },
})
EOF
