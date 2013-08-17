;; tabbar.el
(when (require 'tabbar nil t)
  (tabbar-mode))
;; タブ移動のキーバインドを登録
(global-set-key "\M-p" 'tabbar-backward-tab)
(global-set-key "\M-n" 'tabbar-forward-tab)
;; 全バッファを一つのグループにしまう
(setq tabbar-buffer-groups-function nil)
;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
                tabbar-scroll-left-button
                tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))
;; タブをスクロールさせずに省略して表示
(setq tabbar-auto-scroll-flag nil)
;; タブの長さ
(setq tabbar-separator '(1.5))
;; 色設定
(set-face-attribute
  'tabbar-default nil
  :background "gray90")
(set-face-attribute
  'tabbar-unselected nil
  :background "gray90"
  :foreground "black"
  :box '(:line-width 1 :color "white" :style released-button))
(set-face-attribute
  'tabbar-selected nil
  :background "black"
  :foreground "white"
  :box '(:line-width 1 :color "white" :style pressed-button))
(set-face-attribute
  'tabbar-button nil
  :box '(:line-width 1 :color "gray72" :style released-button))
(set-face-attribute
  'tabbar-separator nil
  :height 0.7)

(defvar my-tabbar-displayed-buffers
  '("*scratch*")
  "*Regexps matches buffer names always included tabs.")
(defun my-tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
  Exclude buffers whose name starts with a space or an asterisk.
  The current buffer and buffers matches `my-tabbar-displayed-buffers'
  are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my-tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
      tabs
      (cons cur-buf tabs))))

(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
