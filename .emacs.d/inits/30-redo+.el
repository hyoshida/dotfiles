(require 'redo+)
(setq undo-no-redo t)
(define-key global-map (kbd "M-/") 'redo)
