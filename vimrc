" Based on Alexey Tcherevatov <darth.lemming@gmail.com> configuration file.
" See <https://github.com/lemming/dotvim/>.

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" режим несовместимости с vi
set nocompatible

" размер табуляции
"set ts=4
" число пробелов, используемых при автоотступе
"set sw=4
" пробелы вместо табуляции
"set et

" нумерация строк
set nu

" инкрементальный поиск
set is

" подсветка всех результатов поиска (:noh, чтобы убрать уже подсвеченные
" результаты)
set hlsearch

" автоматическая расстановка отступов
set autoindent
set smartindent

" подсветка синтаксиса
syntax on

" тема для подсветки синтаксиса
"colorscheme coniferous

" 256 цветов в консоли
set t_Co=256

" хранение всех swap-файлов в одном каталоге
set directory=~/.vim/swap
" возможные кодировки и последовательность определения
set fileencodings=utf8,cp1251
set encoding=utf8

" подсвечивать html-теги в PHP
"let php_htmlInStrings=1

" подсвечивать SQL в PHP
"let php_sql_query=1

" сворачивание классов и функций в PHP
"let php_folding=1

" переключение раскладок
set keymap=russian-jcukenwin
" английская по умолчанию
set iminsert=0 " при вводе
set imsearch=0 " при поиске
" переключение раскладки по ctrl+l
imap <C-l> <C-^>
nmap <C-l> a<C-l><ESC>

" управление вкладками
" <C-tab> works only in GVim, in terminal `tab' is already <C-i>.
" In vim works <C-PgUp>/<C-PgDown>
nmap <C-tab> :tabnext<CR>
vmap <C-tab> <ESC><C-tab>
imap <C-tab> <ESC><C-tab>

" сохранение по F2
nmap <F2> :w<cr>
imap <F2> <ESC><F2>a

" Exit with <F10>
nmap <F10> :qa<cr>
imap <F10> <ESC><F10>
" Force exit with <S-F10>
nmap <S-F10> :qa!<cr>
imap <S-F10> <ESC><S-F10>

" вставка текущего времени и даты по F5
"nmap <F5> "=strftime("%d-%m-%Y %H:%M:%S")"<CR>P
"imap <F5> <C-R>=strftime("%d-%m-%Y %H:%M:%S")<CR>

" «стандартное» поведение клавиши Home
noremap  <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0'  : '^')
"noremap  <expr> <End>  (col('.') == match(getline('.'),    '\s*$')   ? '$'  : 'g_')
"vnoremap <expr> <End>  (col('.') == match(getline('.'),    '\s*$')   ? '$h' : 'g_')
imap <Home> <C-o><Home>
"imap <End>  <C-o><End>

" показывать файловое дерева по нажатию F9
nnoremap <silent> <F9> :NERDTreeToggle <CR>

" Enable spell checking
" http://www.smira.ru/2008/11/17/russian-vim-spell-checking/
" To disable spell locally use `:setlocal nospell'.
"set spell spelllang=en_us,ru

" Similar to ctrl+up/down in other editors.
" TODO: not valid in first or last line!
nmap <C-j> j<C-e>
nmap <C-k> k<C-y>

imap <C-j> <ESC><C-j>a
imap <C-k> <ESC><C-k>a

nmap <C-up>   <C-k>
nmap <C-down> <C-j>
imap <C-up>   <C-k>
imap <C-down> <C-j>

" Unindent with <S-Tab>
" Not needed - use <C-t>/<C-d>
" imap <S-Tab> <ESC>v<i

" Highlight lines longer that 79 characters
" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%80v.\+/

" omnicppcomplete.
" http://vim.wikia.com/wiki/C%2B%2B_code_completion

" configure tags - add additional tags here or comment out not-used ones
filetype plugin on
set tags+=~/.vim/tags/cpp

" map <C-F12> :!ctags -f .tags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-F12> :!ctags -f .tags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set tags+=tags,.tags,../tags,../.tags

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Match angle brackets.
:set matchpairs+=<:>

" From Ubuntu's /etc/vim/vimrc
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

"" From Ubuntu's /etc/vim/vimrc
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" From <http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U>
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
