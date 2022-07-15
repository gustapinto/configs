" Plugins
call plug#begin()
  Plug 'morhetz/gruvbox'
  Plug 'airblade/vim-gitgutter'
call plug#end()

" Theming 
set bg=dark
let g:gruvbox_transparent_bg = '1'
let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox

" Git
set updatetime=100

" Startup configs 
set number

" Maps
:map ns :set number 
:map nn :set nonumber
:map nsr :set relativenumber
:map nnr :set norelativenumber
" Remove trailing whitespace
:map rw :%s/\s\+$//e

