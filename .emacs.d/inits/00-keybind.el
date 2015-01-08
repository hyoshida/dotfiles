;; C-h で Backspace
(keyboard-translate ?\C-h ?\C-?)
(global-set-key (kbd "C-h") nil)

;; バイトコンパイル用のキーバインド登録
(global-set-key (kbd "C-C C-C") 'byte-compile-file)

;; C-x n で使い捨てバッファを開く
(defun generate-temporary-buffer ()
  (interactive)
  (switch-to-buffer
    (generate-new-buffer "*untitled*")))
(global-set-key (kbd "C-x n") 'generate-temporary-buffer)

;; C-w の挙動をシェルに寄せる
;; from http://qiita.com/k_ui/items/e6978008253ba70c037c
(defun backward-kill-word-or-kill-region ()
  (interactive)
  (if (or (not transient-mark-mode) (region-active-p))
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))
(global-set-key (kbd "C-w") 'backward-kill-word-or-kill-region)

;; C-u の挙動を tcsh と同じにする
(global-set-key (kbd "C-u") 'kill-whole-line)

;; MacOSX でなぜか C-@ が動作しないので別のキーバインドで set-mark-command
(global-set-key (kbd "M-SPC") 'set-mark-command)

;; 矩形選択をよりわかりやすくする (M-RETで開始)
(setq cua-enable-cua-keys nil)
(setq cua-rectangle-mark-key (kbd "M-RET"))
(cua-mode t)

;; ウィンドウのリサイズをわかりやすくする
;; from http://d.hatena.ne.jp/khiker/20100119/window_resize
(defun my-window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector (format "size[%dx%d]"
                                                (window-width)
                                                (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (let ((last-command-char (aref action 0))
                     (command (key-binding action)))
                 (when command
                   (call-interactively command)))
               (message "Quit")
               (throw 'end-flag t)))))))
(define-key global-map "\C-xo" (make-sparse-keymap))
(global-set-key "\C-xoo" 'my-window-resizer)
(global-set-key "\C-xol" 'windmove-right)
(global-set-key "\C-xoh" 'windmove-left)
(global-set-key "\C-xoj" 'windmove-down)
(global-set-key "\C-xok" 'windmove-up)
