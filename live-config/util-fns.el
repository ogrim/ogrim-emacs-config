(defun delete-trailing-blank-lines ()
  "Deletes all blank lines at the end of the file."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-max))
      (delete-blank-lines))))

(defun my-next-sentence ()
  (interactive)
  (re-search-forward "[.?!]")
  (if (looking-at "[    \n]+[A-Z]\\|\\\\")
      nil
    (my-next-sentence)))

(defun my-last-sentence ()
  (interactive)
  (re-search-backward "[.?!][   \n]+[A-Z]\\|\\.\\\\" nil t)
  (forward-char))

(defun wc ()
  (interactive)
  (shell-command (concat "wc -w " (buffer-file-name))))

(defun turn-on-linum ()
  (unless (minibufferp)
    (linum-mode 1)))

(setq sentence-end "[^.].[.?!]+\\([]\"')}]*\\|<[^>]+>\\)\\($\\| $\\|\t\\| \\)[ \t\n]*")

;(setq sentence-color "#babaaa")
(setq sentence-bg-color "#383838")
(setq sentence-face (make-face 'sentence-face-background))
;(set-face-foreground sentence-face sentence-color)
(set-face-background sentence-face sentence-bg-color)

(defun sentence-begin-pos () (save-excursion (unless (= (point) (point-max)) (forward-char)) (backward-sentence) (point)))
(defun sentence-end-pos () (save-excursion (unless (= (point) (point-max)) (forward-char)) (backward-sentence) (forward-sentence) (point)))

(setq sentence-highlight-mode nil)

(defun sentence-highlight-current (&rest ignore)
  "Highlight current sentence."
    (and sentence-highlight-mode (> (buffer-size) 0)
    (progn
      (and  (boundp 'sentence-extent)
        sentence-extent
        (move-overlay sentence-extent (sentence-begin-pos) (sentence-end-pos) (current-buffer))))))

(setq sentence-extent (make-overlay 0 0))
(overlay-put sentence-extent 'face sentence-face)

(defun sentence-kill-current (&rest ignore)
  "Kill current sentence."
  (interactive)
  (and sentence-highlight-mode (> (buffer-size) 0)
       (kill-region (sentence-begin-pos) (+ (sentence-end-pos) 1))))
