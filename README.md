## ogrim-emacs-config
My .emacs was long overdue for a cleanup. As I am amazed with the modularity and cleanliness of the live-coding-emacs, and decided to merge my own config with the overtone/live-coding-emacs.

I don't care about the live coding stuff in the original repo, so you can check that out here: https://github.com/overtone/live-coding-emacs

### Getting started

1a. Download the source and move and rename the `live-coding-emacs` folder to `~/.emacs.d`
xor
1b. Download the source and just symlink to it with 'ln -s /path/to/ogrim-emacs-config/ ~/.emacs.d'

2. Launch Emacs
3. you shuld run emacs with 'emacs --daemon'
4. and open a frame with 'emacsclient -c'

It is fast and awesome!

### What's inside?

This config includes an exciting cornucopia of Emacs goodies set up and ready to go. The highlights are:

* Clojure Mode (with fancy `(λ [a] (+ a 5))` and `ƒ(+ % 5)` prettifications)
* Slime (for communicating with swank servers)
* Auto completion (configured to work with slime for inline auto completion of documentation)
* Fancy highlighting of sexps on eval
* REPL syntax highlighting
