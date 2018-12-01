### Simple vimrc


#### Description

[**Vim**](https://en.wikipedia.org/wiki/Vim_%28text_editor%29), a contraction of \(Vi IMproved\) is a clone of Bill Joy's vi editor for Unix.  It was written by Bram Moolenaar based on source for a port of the Stevie editor to the Amiga and first released publicly in 1991. Vim is designed for use both from a command-line interface and as a standalone application in a graphical user interface. Vim is free and open source software and is released under a license that includes some charityware clauses, encouraging users who enjoy the software to consider donating to children in Uganda. The license is compatible with the [GNU General Public License](https://en.wikipedia.org/wiki/GNU_General_Public_License).

This editor is very useful for editing programs and other plain text files. All commands are given with normal keyboard characters, so those who can type with ten fingers can work very fast. Additionally, function keys can be defined by the user, and the mouse can be used.

Vim runs under Amiga DOS, MS-DOS, MS-Windows (95, 98, Me, NT, 2000, XP, Vista, 7), Atari MiNT, Macintosh, BeOS, VMS, RISC OS, OS/2 and almost all flavours of UNIX. Porting to other systems should not be very difficult.  


#### Documentation

The vim tutor is a one hour training course for beginners. Mostly it can be started as vimtutor. See :help tutor for more information.

The best is to use :help in Vim. If you don't have an executable yet, read runtime/doc/help.txt. It contains pointers to the other documentation files. The User Manual reads like a book and is recommended to learn to use Vim. See :help user-manual.

Vimrc includes:

- [x] Installation
- [x] General
- [x] Vundle - Plugins
- [x] Plugins Keys Maps
- [x] Plugins Settings


#### Installation

Vim can be a hackable editor, and custom vim configuration for programming, ex: Python, Ruby, PHP and so.  Plugins as follow: 

https://github.com/gmarik/Vundle.vim  
https://github.com/tomasr/molokai  
https://github.com/klen/python-mode  
https://github.com/scrooloose/nerdtree  
https://github.com/kien/ctrlp.vim  
https://github.com/godlygeek/tabular  
https://github.com/plasticboy/vim-markdown  
https://github.com/bling/vim-airline  
https://github.com/scrooloose/nerdcommenter  
https://github.com/vim-scripts/taglist.vim  
https://github.com/terryma/vim-multiple-cursors  
https://github.com/tpope/vim-fugitive  

**Clone vimrc**

```
$ git clone https://github.com/join-us/vimrc /tmp
```

**Set a new vimrc configutation file**

When we run vim command in terminator, it loads ~/.vimrc. **Pretty-vim** gives us a demo for python / ruby / php.

```
$ cd /tmp
$ git clone https://github.com/join-us/vimrc/
$ cp -f /tmp/vimrc/.vimrc ~/.vimrc
$ mkdir -p ~/.vim/bundle
$ cd ~/.vim/bundle
$ git clone https://github.com/gmarik/Vundle.vim
$ vim -c 'PluginInstall'
```

If you run it on Debian/Arch/OSX, please install **```ctags```** to enable taglist feature:

- Debian Linux - ```$ sudo apt-get install ctags```
- Arch Linux - ```$ sudo pacman -S ctags```
- Mac OSX  - ```$ brew install ctags```



#### Plugins Key Maps

Default keys maps in vimrc, and you can custom it yourself.

```
map <c-n>t :NERDTreeToggle<CR>
set pastetoggle=<c-p>t
map <c-t>t :TlistToggle<CR>
 
map <c-g>g : Gstatus<CR>
map <c-g>l : Glog<CR>
map <c-g>b : Gbrowse<CR>
 
map <c-t>p : tabprevious<CR>
map <c-t>n : tabnext<CR>
map <c-t>c : tabnew<CR>
```
