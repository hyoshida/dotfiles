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
;; 色設定
(set-face-attribute
  'tabbar-default nil
  :background "color-240")
(set-face-attribute
  'tabbar-unselected nil
  :background "color-245"
  :foreground "black")
(set-face-attribute
  'tabbar-selected nil
  :background "black"
  :foreground "white"
  :weight 'bold)

;; タブの余白追加 + バッファに変更があったときのマーク付け
;; from https://github.com/jianingy/emacs-ysl/blob/master/etc-lisp/ysl-tabbar.el
(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
  (setq ad-return-value
        (if (and (buffer-modified-p (tabbar-tab-value tab))
                 (buffer-file-name (tabbar-tab-value tab)))
            (concat " " (concat ad-return-value "* "))
          (concat " " (concat ad-return-value " ")))))

;; 表示するタブを限定
(defvar my-tabbar-displayed-buffers
  '("*scratch*" "*untitled*")
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
