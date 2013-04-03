"语法支持
syntax on
filetype plugin indent on

"通用配置 {{
"自动缩进
set ai
"代码匹配
set showmatch
"设置tab和缩进位置
set expandtab
set shiftwidth =2
set tabstop =2
"光标所在行加下划线
"set cursorline
"显示行号
set number
"文件修改过自动加载
set autoread
"检索时忽略大小写
set ignorecase
"检索时高亮显示匹配项
set hls
"代码折叠
set foldmethod=syntax
"}}

"标签页配置{{
let mapleader = ','
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>t :tabe<CR>
"}}

"插件配置
"pathogen{{
execute pathogen#infect()
"}}

"NERDTree{{
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToToggle<CR>
"}}

"taglist{{
"只显示当前文件的taglist，默认是显示多个
let Tlist_Show_One_File = 1
"如果taglist是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
"在右侧窗口中显示taglist
let Tlist_User_Right_Window = 1
"打开taglist时，光标保留在taglist窗口
let Tlist_GainFocus_On_ToggleOpen = 1
"设置关闭和打开taglist窗口的快捷键
nnoremap <leader>tl :Tlist<CR>
"}}

"neocomplcache{{
"let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

autocmd filetype css setlocal omnifunc=csscomplete#CompleteCSS
autocmd filetype html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd filetype javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd filetype python setlocal omnifunc=pythoncomplete#Complete
autocmd filetype xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"}}
