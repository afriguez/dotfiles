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
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'

" syntax hi, filetype detection, format
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'afriguez/dracula.nvim'

" interface
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme dracula

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
	  \ 'coc-css',
	  \ 'coc-webview',
	  \ 'coc-markdown-preview-enhanced' ]

" fugitive
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gk :Git commit<CR>

" telescope
nnoremap <leader>gi <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fi <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" harpoon
nnoremap <leader>hf <cmd>lua require('harpoon.mark').add_file()<cr>
nnoremap <leader>hl <cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>

nnoremap gp :call CocAction('runCommand', 'prettier.formatFile')<CR>

let g:mkdp_auto_start = 1
let g:mkdp_refresh_slow = 1
let g:airline_theme='violet'

let g:vim_jsx_pretty_colorful_config = 1

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
