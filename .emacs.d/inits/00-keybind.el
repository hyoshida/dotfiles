;; C-h で Backspace
(global-set-key "\C-h" 'delete-backward-char)

;; バイトコンパイル用のキーバインド登録
(global-set-key (kbd "C-C C-C") 'byte-compile-file)

;; C-x n で使い捨てバッファを開く
(defun generate-temporary-buffer ()
  (interactive)
  (switch-to-buffer
    (generate-new-buffer "*untitled*")))
(global-set-key (kbd "C-x n") 'generate-temporary-buffer)
