;; "org" because C-h f org-mode RET says that org-mode is defined in org.el
(eval-after-load "org"
  '(progn
     (define-key org-mode-map (kbd "<RET>") 'org-insert-heading)
     (define-key org-mode-map (kbd "S-<RET>") 'org-insert-heading-respect-content)
     (define-key org-mode-map (kbd "✠") 'org-insert-heading-respect-content)
     ))
