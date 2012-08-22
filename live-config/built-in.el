(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; create autosaves and backups tmp dirs if necessary
(make-directory (concat dotfiles-tmp-dir "autosaves") t)
(make-directory (concat dotfiles-tmp-dir "backups") t)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/tmp/
(setq auto-save-file-name-transforms `((".*" ,(concat dotfiles-tmp-dir "autosaves/\\1") t)))
(setq backup-directory-alist `((".*" . ,(concat dotfiles-tmp-dir "backups"))))
(setq auto-save-list-file-name (concat dotfiles-tmp-dir "autosaves/autosave-list"))

;;When you visit a file, point goes to the last place where it was when you previously visited
;;Save file is set to dotfiles-tmp-dir/places
(require 'saveplace)
(setq-default save-place t)


(require 'cua-base)
(require 'cua-gmrk)
(require 'cua-rect)
;; (cua-mode 1)
;; (setq cua-enable-cua-keys nil)

;;enable winner mode for C-c-(<left>|<right>) to navigate the history
;;of buffer changes i.e. undo a split screen
(when (fboundp 'winner-mode)
      (winner-mode 1))

(setq visible-bell t
      column-number-mode t
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      shift-select-mode nil
      mouse-yank-at-point t
      require-final-newline t
      truncate-partial-width-windows nil
      delete-by-moving-to-trash nil
      uniquify-buffer-name-style 'forward
      ediff-window-setup-function 'ediff-setup-windows-plain
      xterm-mouse-mode t
      save-place-file (concat dotfiles-tmp-dir "places")
      display-time-day-and-date t
      display-time-24hr-format t)

;; (setq locale-coding-system 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)
;; (ansi-color-for-comint-mode-on)

(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(set-language-environment 'utf-8)
;(set-keyboard-coding-system 'utf-8-mac) ; For old Carbon emacs on OS X only
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun reload-and-remove-dos ()
  (interactive)
  (revert-buffer t t)
  (remove-dos-eol))

;(global-set-key (kbd "<f12>") 'reload-and-remove-dos)

(global-set-key (kbd "<f12>") (lambda ()
                                (interactive)
                                (revert-buffer t t)))



(set-default 'indent-tabs-mode nil)
(auto-compression-mode t)
(show-paren-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(random t) ;; Seed the random-number generator

(setq diff-switches "-u")

(mouse-avoidance-mode 'cat-and-mouse)

(display-time)


(when (eq system-type 'darwin)
  ;; Work around a bug on OS X where system-name is FQDN
  (setq system-name (car (split-string system-name "\\."))))

;; make emacs use the clipboard
(setq x-select-enable-clipboard t)

(setq confirm-nonexistent-file-or-buffer nil)

;;remove all trailing whitespace and trailing blank lines before saving the file
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-blank-lines)
