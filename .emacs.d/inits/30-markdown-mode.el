;; タブ移動のグローバルキーバインドを有効にするためにローカルキーバインドを無効化
(add-hook 'markdown-mode-hook
          (lambda()
            (dolist (key '("\M-p" "\M-n"))
              (local-unset-key key))))
