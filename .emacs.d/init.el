;; 日本語環境にする
(set-language-environment "japanese")
(set-default-coding-systems 'euc-jp) ;標準でeucを使う
;; スクロールバーを右側にする
;;(set-scroll-bar-mode 'right)
;; 括弧の対応を表示する
(show-paren-mode t)
;; ビープ音の代りに画面を点滅させる
;(setq visible-bell t)
;; カーソルの位置が何行目か表示する。
(line-number-mode t)
;; カーソルの位置が何文字目か表示する。
(column-number-mode t)
;; スプラッシュを表示しない
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
;; テキストの色を一色にする
;;(global-font-lock-mode nil)
(global-set-key (kbd "C-C C-C") 'byte-compile-file)
;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)
;; C-h で Backspace
(global-set-key "\C-h" 'delete-backward-char)
;; ツールバーを隠す
;;(tool-bar-mode -1)
;; メニューバーを隠す
(menu-bar-mode -1)

;; anthy との共存
(cond (window-system
       (require 'scim-bridge-ja)
       (add-hook 'after-init-hook 'scim-mode-on)
       ; C-SPC は Set Mark に使う
       ;(scim-define-common-key ?\C-\s nil)
       ; C-/ は Undo に使う
       (scim-define-common-key ?\C-/ nil)))

;; ~/.emacs.d/site-lisp を load-path に追加
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
    (add-to-list 'load-path default-directory)
      (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
              (normal-top-level-add-subdirs-to-load-path)))

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



;; tabbar.el
(when (require 'tabbar nil t)
    (tabbar-mode))
;; 例: 全バッファを一つのグループにしまう
(setq tabbar-buffer-groups-function nil)
;;
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



;;;;  flymake for ruby
(require 'flymake)
;; I don't like the default colors :)
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")
;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))
(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)


(add-hook
 'ruby-mode-hook
 '(lambda ()
    ;; Don't want flymake mode for ruby regions in rhtml files
    (if (not (null buffer-file-name)) (flymake-mode))))
