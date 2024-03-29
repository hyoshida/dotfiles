;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     git
     markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     helm-ls-git
     tabbar
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; Set evil-toggle-key to C-\ to free up C-z for suspending
  (setq-default evil-toggle-key "C-\\")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Disable the mouse support
  (xterm-mouse-mode -1)

  ;; Listing the files in a git repo.
  (spacemacs/set-leader-keys "fF" 'helm-ls-git-ls)

  ;; Disable current line highlight
  (global-hl-line-mode -1)

  ;; Close a tab
  (evil-ex-define-cmd "q[uit]" 'kill-this-buffer)

  ;; Disable magic comment auto insertion in ruby-mode
  (setq ruby-insert-encoding-magic-comment nil)

  ;; C-h is Backspace
  (keyboard-translate ?\C-h ?\C-?)
  (global-set-key (kbd "C-h") nil)

  ;; C-x n to open temporary buffer
  (defun generate-temporary-buffer ()
    (interactive)
    (switch-to-buffer
      (generate-new-buffer "*untitled*")))
  (global-set-key (kbd "C-x n") 'generate-temporary-buffer)

  ;; C-w like shell
  ;; from http://qiita.com/k_ui/items/e6978008253ba70c037c
  (defun backward-kill-word-or-kill-region ()
    (interactive)
    (if (or (not transient-mark-mode) (region-active-p))
        (kill-region (region-beginning) (region-end))
      (backward-kill-word 1)))
  (global-set-key (kbd "C-w") 'backward-kill-word-or-kill-region)

  ;; C-u like tcsh
  (global-set-key (kbd "C-u") 'kill-whole-line)

  ;; Settings for tabbar
  ;; TODO: 設定の整理
  ;; -------------------
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
  ;; called each time the modification state of the buffer changed
  (defun ztl-modification-state-change ()
    (tabbar-set-template tabbar-current-tabset nil)
    (tabbar-display-update))
  ;; first-change-hook is called BEFORE the change is made
  (defun ztl-on-buffer-modification ()
    (set-buffer-modified-p t)
    (ztl-modification-state-change))
  (add-hook 'after-save-hook 'ztl-modification-state-change)
  (add-hook 'first-change-hook 'ztl-on-buffer-modification)

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
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.


;; Custom set faces
;; ----------------
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "color-232")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(
      helm-gitignore
      winum
      uuidgen
      queue
      org-projectile
      org-category-capture
      org-mime
      org-download
      magit-section
      link-hint
      git-link
      compat
      eyebrowse
      evil-visual-mark-mode
      evil-unimpaired
      f
      dumb-jump
      column-enforce-mode
      ht
      ws-butler
      window-numbering
      volatile-highlights
      vi-tilde-fringe
      undo-tree
      toc-org
      tabbar
      spacemacs-theme
      spaceline
      powerline
      smooth-scrolling
      smeargle
      restart-emacs
      rainbow-delimiters
      popwin
      persp-mode
      pcre2el
      paradox
      hydra
      spinner
      lv
      page-break-lines
      orgit
      org-repo-todo
      org-present
      org-pomodoro
      alert
      log4e
      gntp
      org-plus-contrib
      org-bullets
      open-junk-file
      neotree
      move-text
      mmm-mode
      markdown-toc
      s
      markdown-mode
      magit-gitflow
      magit-popup
      macrostep
      lorem-ipsum
      linum-relative
      leuven-theme
      indent-guide
      ido-vertical-mode
      hungry-delete
      htmlize
      hl-todo
      highlight-parentheses
      highlight-numbers
      parent-mode
      highlight-indentation
      helm-themes
      helm-swoop
      helm-projectile
      projectile
      pkg-info
      epl
      helm-mode-manager
      helm-make
      helm-ls-git
      request
      helm-flx
      helm-descbinds
      helm-ag
      google-translate
      golden-ratio
      gnuplot
      git-timemachine
      git-messenger
      gh-md
      flx-ido
      flx
      fill-column-indicator
      fancy-battery
      expand-region
      exec-path-from-shell
      evil-visualstar
      evil-tutor
      evil-surround
      evil-search-highlight-persist
      highlight
      evil-numbers
      evil-nerd-commenter
      evil-mc
      evil-matchit
      evil-magit
      magit
      git-commit
      with-editor
      transient
      evil-lisp-state
      smartparens
      dash
      evil-indent-plus
      evil-iedit-state
      iedit
      evil-exchange
      evil-escape
      evil-args
      evil-anzu
      anzu
      eval-sexp-fu
      elisp-slime-nav
      diminish
      define-word
      clean-aindent-mode
      buffer-move
      bracketed-paste
      auto-highlight-symbol
      auto-compile
      packed
      aggressive-indent
      adaptive-wrap
      ace-window
      ace-link
      ace-jump-helm-line
      helm
      avy
      helm-core
      popup
      async
      quelpa
      package-build
      use-package
      which-key
      bind-key
      bind-map
      evil
      monokai-theme
      disable-mouse
    )
  )
)
