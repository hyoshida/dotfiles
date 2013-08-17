;; デフォルトの文字コードを UTF-8 にする
(set-default-coding-systems 'utf-8)

;; 括弧の対応を表示する
(show-paren-mode t)

;; ハイライトを有効化
(transient-mark-mode 1)

;; カーソルの位置が何行目か表示する。
(line-number-mode t)
;; カーソルの位置が何文字目か表示する。
(column-number-mode t)

;; スクロール量を 1 行分にする
(setq scroll-step 1)

;; スプラッシュを表示しない
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; メニューバーを隠す
(menu-bar-mode -1)

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")
