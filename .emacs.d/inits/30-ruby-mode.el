(add-hook 'ruby-mode-hook
  (lambda ()
    (modify-syntax-entry ?_ "w" ruby-mode-syntax-table)))
