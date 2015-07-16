; Remap evil-mode toggle key from C-z to C-x `
; http://askubuntu.com/questions/99160/how-to-remap-emacs-evil-mode-toggle-key-from-ctrl-z
(setq evil-toggle-key "C-x `")
(global-set-key (kbd evil-toggle-key) 'evil-mode)

; for helm
(require 'evil-maps)

(when (require 'helm-config nil t)
  (define-key evil-normal-state-map (kbd "SPC f f") 'helm-find-files)
  (define-key evil-normal-state-map (kbd "SPC f m") 'helm-recentf)
  (define-key evil-normal-state-map (kbd "SPC f b") 'helm-buffers-list)
  (define-key evil-normal-state-map (kbd "SPC f o") 'helm-imenu)
)
