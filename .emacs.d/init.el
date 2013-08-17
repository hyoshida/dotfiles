;; ~/.emacs.d/site-lisp を load-path に追加
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (normal-top-level-add-subdirs-to-load-path)))

;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

;; auto-install
;(require 'auto-install)
;(setq auto-install-directory "~/.emacs.d/auto-install")
;;(auto-install-update-emacswiki-package-name t)
;(auto-install-compatibility-setup)             ; 互換性確保
;(add-to-list 'load-path "~/.emacs.d/auto-install")
;
;;; anything
;(require 'anything)
;(defvar org-directory "")
;(require 'anything-startup)
