Parano's vim files
================


## Installation ##

Clone this repo into ```~/.vim```.

``` 
git clone git://github.com/parano/vimfiles.git ~/.vim 
```

Create link for ```.vimrc```.
```ln -s .vim/vimrc .vimrc```

Set up Vundle:

```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```


Install bundled plugins.
```
vim +BundleInstall +qall
```

create ```~/.vim/swaps``` and ```~/.vim/backups```.

``` 
mkdir -p ~/.vim/swaps ~/.vim/backups 
```

## Dependencies ##
* Vim 7.3+
* Exuberant Ctags (http://ctags.sourceforge.net/)
* Python support for Vim
* ack-grep
* Python 2.4+

## Theme ##
[IR_BLACK] (http://blog.toddwerth.com/entries/8)


## Key Bindings

* F1 - Quick Save
* F2 - Toggle Paste Mode
* F3 - Insert current time
* F4 - GundoToggle
* F5 - NERDTreeToggle
* F6 - TagbarToggle

## ##  
have fun ;-)
