;; highlight expression on eval
(require 'highlight)
(require 'eval-sexp-fu)
(setq eval-sexp-fu-flash-duration 0.2)
(setq eval-sexp-fu-flash-face
      '((((class color)) (:background "#656555" :foreground "#dcdccc" :bold t))))
