(require 'sr-speedbar)

;; 未知のファイルでもとりあえず表示
(setq speedbar-show-unknown-files t)

;; M-sでspeedbarをトグル
(global-set-key (kbd "M-s") '(lambda () (interactive) (sr-speedbar-toggle) (speedbar-get-focus) (sr-speedbar-select-window)))

;; .rbファイルをctagsサポートに追加
(speedbar-add-supported-extension ".rb")
(add-to-list 'speedbar-fetch-etags-parse-list
             '("\\.rb" . speedbar-parse-c-or-c++tag))

;; C-wでも上位ディレクトリに移動 (デフォルト: U)(
(define-key speedbar-file-key-map (kbd "C-w") 'speedbar-up-directory)

;; qで閉じる
(define-key speedbar-file-key-map (kbd "q") 'sr-speedbar-close)
