
set noequalalways
set ic
set laststatus=2 cmdheight=2 ruler bs=2
set ts=2 sw=2 expandtab
set showmatch

autocmd filetype c,cpp,java,ruby,perl,php set cindent
autocmd filetype html,css set ai nocindent
autocmd filetype javascript set ai
autocmd filetype py set ai ts=4 sw=4
autocmd BufRead *.h set cindent ai showmatch
autocmd BufRead *.txt set linebreak
autocmd BufRead *.bat set ai

if has("win32")
   " winders
   set nobackup
   set nowritebackup
   set backupdir=$HOME/.vimbackup//
   set directory=$HOME/.vimbackup//
endif

" '20 -> save marks for last 20 files
" "50 -> save 50 list for each register, number of lines to remember
" :20 -> save 20 lines of command history
set viminfo='20,\"50,:20

set diffopt=filler,vertical

if has("gui_running")

   if version >= 700
      set cursorline
   endif

   if has("gui_win32")
      set guifont=Lucida\ Console:h10
      set lines=50
   else
      set guifont=Monospace\ 10

      " I'm using $DISPLAY to distinguish between VNC and real desktop
      " There is probably a way to check for the screen resolution but this
      " is a quick fix :)
      if $DISPLAY == ":0.0"
         " normal desktop
         set lines=70
      else
         " vnc session
         set lines=60
      endif

   endif

   colorscheme desert
   syntax on
   set hls

   if &diff
    set columns=166
   else
    set columns=161
   endif

   if version < 703
      " no toolbar
      set toolbar=
   endif

   " no scrollbars, no menu
   " absent options are m,l,r,b (menu left right and bottom scrollbars)
   set guioptions=

   " show tabs and trailing spaces
   set listchars=trail:-,tab:+- list

else
   " no gui running

   " Apparently all the terminals I use can support 256 colors even
   " though t_Co may not report it correctly.
   if $TERM == "xterm-color" || $TERM == "xterm"

      " assume 256 colors
      set t_Co=256
      colorscheme thirsty
      syntax on

      " show tabs and trailing spaces
      set listchars=trail:-,tab:+- list

      set hls

   elseif $TERM == "xterm-mac"

      " custom term for my mac that doesn't support 256 colors :(
      set t_Co=8
      colorscheme desert
      syntax on
      set nohls

   elseif $TERM == "cygwin"

      colorscheme desert
      syntax on
      set nohls

   else

      " only two colors or maybe one? :)
      " too hard to see in two color term
      set nohls

   endif

   set mouse=a

endif

