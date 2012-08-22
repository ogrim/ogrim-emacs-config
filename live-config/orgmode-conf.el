(add-live-lib-path "org-mode/lisp")
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(defvar *timetable* "
| timestamp | timer dag | timer aktivitet | aktivitet |
|-----------+-----------+-----------------+-----------|
|           |           |                 |           |
|           |           |                 |           |
|           |           |                 |           |
|           |           |                 |           |
|           |           |                 |           |
|           |           |                 |           |
| sum       |         0 |               0 |           |
#+TBLFM: @8$2=vsum(@2$2..@7$2)::@8$3=vsum(@2$3..@7$3)")

;; Parse an HH::MM date into a list containing a pair of numbers, (HH MM)
(defun my-parse-hhmm (hhmm)
 (let ((date-re "\\([0-9]+\\):\\([0-9]+\\)h?")
        hours
        minutes)
   (unless (string-match date-re hhmm)
     (error "Argument is not a valid date: '%s'" hhmm))
   (setq hours (string-to-number (match-string 1 hhmm))
          minutes (string-to-number (match-string 2 hhmm)))
   (list hours minutes)))

;; Convert a HH:MM date to a (possibly fractional) number of hours
(defun my-hhmm-to-hours (hhmm)
 (let* ((date (my-parse-hhmm hhmm))
        (hours (first date))
        (minutes (second date)))
   (+ (float hours) (/ (float minutes) 60.0))))

(defun timerange-insert-hours (&optional lunch)
  (interactive)
  (org-evaluate-time-range t)
  (kill-word 2)
  (insert (number-to-string (my-hhmm-to-hours (substring-no-properties (car kill-ring)))))
  (org-cycle))

(defun timerange-insert-hours-minus-lunch ()
  (interactive)
  (org-evaluate-time-range t)
  (kill-word 2)
  (insert (number-to-string (- (my-hhmm-to-hours (substring-no-properties (car kill-ring))) 0.5)))
  (org-cycle))

(defun insert-timetable ()
  (interactive)
  (insert *timetable*))

(defun org-table-to-excel ()
  (interactive)
  (if (org-at-table-p)
      (let ((file org-table-to-excel-file-name)(excel-command))
        (org-table-to-cvs-file file)
        (setq excel-command (concat excel-exec-string file))
        (wuxch-shell-command-background excel-command)
        (message "command is :%s" excel-command)
        )
    )
  )

(defun org-table-to-cvs-file (file-name)
  ""
  (let* ((beg (org-table-begin))
         (end (org-table-end))
         (table (buffer-substring beg end))
         (file file-name)
         buf)
    ;; (unless (or (not (file-exists-p file))
    ;;                 (y-or-n-p (format "Overwrite file %s? " file)))
    ;;       (error "Abort"))
    ;; ????,??????
    (if (file-exists-p file)
        (delete-file file))
    (with-current-buffer (find-file-noselect file)
      (setq buf (current-buffer))
      (erase-buffer)
      (fundamental-mode)
      (insert table)
      (goto-char (point-min))
      (while (re-search-forward "^[ \t]*|[ \t]*" nil t)
        (replace-match "" t t)
        (end-of-line 1))
      (goto-char (point-min))
      (while (re-search-forward "[ \t]*|[ \t]*$" nil t)
        (replace-match "" t t)
        (goto-char (min (1+ (point)) (point-max))))
      (goto-char (point-min))
      (while (re-search-forward "^-[-+]*$" nil t)
        (replace-match "")
        (if (looking-at "\n")
            (delete-char 1)))
      (goto-char (point-min))
      (while (re-search-forward "[ \t]*|[ \t]*" nil t)
        (replace-match "\t" t t))
      (save-buffer))
    (kill-buffer buf)
    )
  )

(defun org-table-to-cvs ()
  (interactive)
  (org-table-to-cvs-file "c:\\org\\org.cvs"))
