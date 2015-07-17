(add-hook 'ruby-mode-hook
  (lambda ()
    (modify-syntax-entry ?_ "w" ruby-mode-syntax-table)))

;; Don't insert encoding magic comment
(setq ruby-insert-encoding-magic-comment nil)
