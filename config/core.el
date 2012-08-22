;; Here is the root of your personal configs.

(load-dotfile "config/orgmode-conf.el")
(load-dotfile "config/windows.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load bindings last, so all other symbols exist
(load-dotfile "config/bindings.el")
