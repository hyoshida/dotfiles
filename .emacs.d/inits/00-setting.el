;; デフォルトの文字コードを UTF-8 にする
(set-default-coding-systems 'utf-8)
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
;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)
;; ツールバーを隠す
;;(tool-bar-mode -1)
;; メニューバーを隠す
(menu-bar-mode -1)
;; ハイライトを有効化
(transient-mark-mode 1)
;; スクロール量を 1 行分にする
(setq scroll-step 1)
;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")
