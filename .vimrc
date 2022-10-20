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

hi Normal guibg=NONE ctermbg=NONE

" Rulers
set colorcolumn=72,80,100,120

" Git
set updatetime=100

" Startup configs
set number relativenumber

" Maps
:map ns :set number relativenumber
:map nn :set nonumber norelativenumber
" Remove trailing whitespace
:map rw :%s/\s\+$//e

" Commands
:command Pymain :normal i if __name__ == '__main__':<ESC>
:command Gomain :normal i func main() {<CR>}
:command Pep8 !autopep8 -i expand('%:p')
