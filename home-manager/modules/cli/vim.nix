{ pkgs, ... }:

let
  vimPlugins = with pkgs.vimPlugins; [
    vim-plug
    fzf-vim
    vim-airline
    nerdtree
    vim-fugitive
    coc-nvim
    vim-wayland-clipboard
  ];
in {
  home.packages = with pkgs; [
    nodejs
    clang-tools
  ];

  # on first execution, run :CocInstall coc-clangd
  programs.vim = {
    enable = true;
    plugins = vimPlugins;
    extraConfig = ''
      let g:airline_powerline_fonts = 1
      set bg=dark
      syntax on
      set number
      set relativenumber
      set tabstop=2
      set shiftwidth=2
      set expandtab
      set smartindent
      set autoindent
      set nowrap
      set clipboard=unnamedplus
      set scrolloff=8
      set mouse=a

      autocmd VimEnter *
        \ if filereadable('input.txt') | tabedit input.txt | endif |
        \ execute 'tabfirst'

      nnoremap <Tab> :tabprevious<CR>
      nnoremap <S-Tab> :tabnext<CR>
      inoremap {<CR> {<CR>}<Esc>O

      autocmd FileType cpp noremap <F6>  :w <bar> !clear && g++ -D OII -std=c++17 -fsanitize=address -g -Og -Wall -Wextra %:t -o %:r.out && ./%:r.out < input.txt<CR>
      autocmd FileType cpp noremap <F7>  :w <bar> !clear && g++ -D OII -std=c++17 -fsanitize=address -g -Og -Wall -Wextra %:t -o %:r.out && ./%:r.out <CR>

      autocmd FileType cpp noremap <F8>  :w <bar> !clear && g++ -D OII -std=c++17 -O2 %:t -o %:r.out && ./%:r.out < input.txt<CR>
      autocmd FileType cpp noremap <F9>  :w <bar> !clear && g++ -D OII -std=c++17 -O2 %:t -o %:r.out && ./%:r.out<CR>
      autocmd FileType cpp noremap <F10> :w <bar> !clear && g++ -D OII -std=c++17 -O2 %:t -o %:r.out && ./%:r.out < input.txt > output.txt & ; tail -f output.txt<CR>

      let &t_SI = "\e[6 q"
      let &t_EI = "\e[2 q"

      set timeoutlen=1000 ttimeoutlen=0
      inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
    '';
  };
}
