;; C-h で Backspace
(global-set-key "\C-h" 'delete-backward-char)

;; バイトコンパイル用のキーバインド登録
(global-set-key (kbd "C-C C-C") 'byte-compile-file)
