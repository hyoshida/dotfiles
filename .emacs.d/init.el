;; ~/.emacs.d/site-lisp を load-path に追加
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  ;; TODO: バージョンごとにディレクトリを分ける
  (if (<= emacs-major-version 24)
    (add-to-list 'load-path (concat default-directory "/init-loader"))
    (add-to-list 'load-path default-directory)
    )
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (normal-top-level-add-subdirs-to-load-path)))

;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
