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

  programs.vim = {
    enable = true;
    plugins = vimPlugins;
    extraConfig = ''
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

      augroup CppRun
        autocmd!
        autocmd FileType cpp nnoremap <buffer> <F7> :w<CR>:!clear && ./run.sh<CR>
        autocmd FileType cpp nnoremap <buffer> <F8> :w<CR>:!clear && ./run.sh < input.txt<CR>
        autocmd FileType cpp nnoremap <buffer> <F9> :w<CR>:!clear && ./run.sh > output.txt<CR>
        autocmd FileType cpp nnoremap <buffer> <F10> :w<CR>:!clear && ./run.sh < input.txt > output.txt<CR>
      augroup END

      let &t_SI = "\e[6 q"
      let &t_EI = "\e[2 q"

      set timeoutlen=1000 ttimeoutlen=0
      inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
    '';
  };
}
