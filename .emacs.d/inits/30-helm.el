;; refs https://github.com/emacs-helm/helm#basic-usage
(helm-mode 1)

(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "C-w") 'helm-find-files-up-one-level)
