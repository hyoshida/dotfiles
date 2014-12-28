;; Settings for Wanderlust
;;
;; refs:
;;   http://www.emacswiki.org/emacs/WanderLust
;;   http://www.gohome.org/wl/doc/wl-euc_36.html
;;   http://www.geocities.jp/maple4estry/wanderlust.html


;; IMAP, gmail:
(setq elmo-imap4-default-server "imap.gmail.com"
      elmo-imap4-default-user "hyoshida@appirits.com"
      elmo-imap4-default-authenticate-type 'clear
      elmo-imap4-default-port '993
      elmo-imap4-default-stream-type 'ssl

      ;;for non ascii-characters in folder-names
      elmo-imap4-use-modified-utf7 t)

;; POP3
(setq elmo-pop3-default-server "mail44.kbmj.jp"
      elmo-pop3-default-user "hyoshida"
      elmo-imap4-default-authenticate-type 'clear
      elmo-pop3-default-port '110
      elmo-pop3-default-stream-type 'starttls

      ;; for insecure connection
      starttls-extra-arguments '("--insecure"))

;; SMTP
(setq wl-smtp-connection-type 'starttls
      wl-smtp-posting-port 587
      wl-smtp-authenticate-type "plain"
      wl-smtp-posting-user "hyoshida"
      wl-smtp-posting-server "smtp.gmail.com"
      wl-local-domain "gmail.com"
      wl-message-id-domain "smtp.gmail.com")

(setq wl-from "吉田啓紀 <hyoshida@appirits.com>"
      ;;all system folders (draft, trash, spam, etc) are placed in the
      ;;[Gmail]-folder, except inbox. "%" means it's an IMAP-folder
      wl-default-folder "%inbox"
      wl-draft-folder   "%[Gmail]/Drafts"
      wl-trash-folder   "%[Gmail]/Trash"
      wl-fcc            "%[Gmail]/Sent"

      ;; mark sent messages as read (sent messages get sent back to you and
      ;; placed in the folder specified by wl-fcc)
      wl-fcc-force-as-read    t

      ;;for when auto-compleating foldernames
      wl-default-spec "%")

;; メッセージを送信する前に確認をする
(setq wl-interactive-send t)

;; 3 pains
(setq wl-stay-folder-window t)
(setq wl-folder-window-width 35)

;; サマリの表示幅を制限しない
(setq wl-summary-width nil)

;; メールを書くときはフル画面表示
;; (setq wl-draft-reply-buffer-style 'full)

;; メール送信するときに自分を含めない
;; (setq wl-draft-always-delete-myself t)

;; 大きいメッセージを送信時に分割しない
(setq mime-edit-split-message nil)

;; 着信通知
(setq wl-biff-check-folder-list '("%inbox"))

;; summary-mode ですべての header を一旦除去
(setq mime-view-ignored-field-list '("^.*"))

;; 表示するヘッダ
(setq wl-message-visible-field-list
      (append mime-view-visible-field-list
        '("^Subject:" "^From:" "^To:" "^Cc:"
          "^X-Mailer:" "^X-Newsreader:" "^User-Agent:"
          "^X-Face:" "^X-Mail-Count:" "^X-ML-COUNT:"
          )))

;; Gmailと同じように"!"で迷惑メール送り
(defun st-wl-summary-refile-spam ()
  (interactive)
  (wl-summary-refile (wl-summary-message-number) "%[Gmail]/迷惑メール")
  (wl-summary-next))
(define-key wl-summary-mode-map "!" 'st-wl-summary-refile-spam)
(define-key wl-summary-mode-map "\M-u" 'wl-summary-mark-as-unread)

;; 添付ファイルがある場合は「@」を表示
(setq wl-summary-line-format "%n%T%P%1@%Y/%M/%D(%W)%h:%m %t%[%17(%c %f%) %] %#%~%s")
(setq wl-summary-line-format-spec-alist
  (append wl-summary-line-format-spec-alist
    '((?@ (wl-summary-line-attached)))))

;; Notify Mail arrival
(setq wl-biff-check-folder-list '("%inbox"))
(setq wl-biff-check-interval 60)
(setq wl-biff-use-idle-timer t)
; (setq wl-biff-notify-hook (lambda() (popup-message "Wanderlust" "You have new mail!")))
(setq wl-biff-notify-hook '(ding))

;; refs http://www.funtoo.org/Package:Emacs
(defun popup-message (title msg &optional sound)
  "Show a popup if we're on X, or echo it otherwise; TITLE is the title of the message, MSG is the context. Optionally, you can provide a sound to be played"
  (interactive)
  (when sound (shell-command
               (concat "mplayer -really-quiet " sound " 2> /dev/null")))
  (if (eq window-system 'x)
      (shell-command (concat "notify-send '" title "' '" msg "'"))
    ;; text only version
    (message (concat title ": " msg))))
