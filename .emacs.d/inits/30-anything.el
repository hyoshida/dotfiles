;; anything
(require 'anything)
(require 'anything-startup)

;; C-x b でバッファ、最近使ったファイル、カレントディレクトリのファイルを列挙
(define-key global-map (kbd "C-x b") 'anything-for-files)
