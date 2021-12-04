call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'

Plug 'StanAngeloff/php.vim'
Plug 'rayburgemeestre/phpfolding.vim'

Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'phpactor/ncm2-phpactor'
Plug 'arnaud-lb/vim-php-namespace'

Plug 'cohama/lexima.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'

Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'borissov/vim-mysql-suggestions'
Plug 'jparise/vim-graphql'
Plug 'scrooloose/syntastic'
Plug 'yggdroot/indentline'
Plug 'symfony/symfony'

call plug#end()

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Configurações básicas 
syntax enable
set encoding=UTF-8
set number
set relativenumber
set inccommand=split

set laststatus=2
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Configurações para o phpDoc
function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction
augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

hi phpUseNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE
hi phpClassNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE
syn match phpParentOnly "[()]" contained containedin=phpParent
hi phpParentOnly guifg=#f08080 guibg=NONE gui=NONE

" Essas configurações são para gerar importação automática de pacotes
" Importar classes ou funções (adicionar instruções de uso)
" Documentação em: https://github.com/arnaud-lb/vim-php-namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" Configurações de atalhos
let mapleader="\<space>"
nnoremap <leader>; A;<esc>
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>
nnoremap <c-t> :NERDTreeToggle<cr>

map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <F6> <Esc>:EnablePHPFolds<Cr>
map <F7> <Esc>:DisablePHPFolds<Cr>

" Configurações para o tema que estou utilizando
colorscheme gruvbox
set background=dark
