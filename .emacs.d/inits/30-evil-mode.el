(require 'evil-maps)

; for helm
(when (require 'helm-config nil t)
  (define-key evil-normal-state-map (kbd "SPC f f") 'helm-find-files)
  (define-key evil-normal-state-map (kbd "SPC f m") 'helm-recentf)
  (define-key evil-normal-state-map (kbd "SPC f b") 'helm-buffers-list)
  (define-key evil-normal-state-map (kbd "SPC f o") 'helm-imenu)
)
