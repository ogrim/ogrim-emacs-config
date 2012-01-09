## ogrim-emacs-config
My .emacs was long overdue for a cleanup. As I am amazed with the modularity and cleanliness of the overtone/live-coding-emacs repository, and decided to merge my own config into this.

I don't care about the live coding stuff in the original repo, so you can check that out here: https://github.com/overtone/live-coding-emacs. I am also using submodules to keep track of libraries, so I don't have to manually update them all the time.

### Getting started

1. Run `git clone https://ogrim@github.com/ogrim/ogrim-emacs-config.git` to get the repository, and `git submodule update --init` to initialize and update the submodules we are using.
2. In order to tell emacs to use this config, you can to one of two things:
   * Move and rename the `live-coding-emacs` folder to `~/.emacs.d`
   * Symlink to the checked out repository with `ln -s /path/to/ogrim-emacs-config/ ~/.emacs.d`
3. You shuld run emacs with `emacs --daemon` and open a frame with `emacsclient -c`

Emacs in daemon mode is fast and awesome!

### Updating submodules

* Checkout master branch from all submodules with `git submodule foreach git checkout master`

* Pull the latest changes from submodules' remote repository with `git submodule foreach git pull`. I pull as local changes are not made to the submodules.


### What's inside?

This config includes an exciting cornucopia of Emacs goodies set up and ready to go. The highlights are:

* Clojure Mode (with fancy `(λ [a] (+ a 5))` and `ƒ(+ % 5)` prettifications)
* Slime (for communicating with swank servers)
* Auto completion (configured to work with slime for inline auto completion of documentation)
* Sexy Zenburn color theme
* Fancy highlighting of sexps on eval, with nicer colors
* REPL syntax highlighting