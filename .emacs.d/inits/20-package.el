;; from http://qiita.com/catatsuy/items/5f1cd86e2522fd3384a0
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(require 'cl)

(defvar installing-package-list
  '(
    tabbar
    powerline
    monokai-theme
    helm
    redo+
    org
    evil
    php-mode
    scala-mode
    markdown-mode
    scss-mode
    yaml-mode
    slim-mode
    coffee-mode
    sr-speedbar

    wanderlust
    undo-tree
    flymake-ruby
    ))

(let ((not-installed (loop for x in installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (message (concat "Installing package: " (symbol-name pkg)))
      (package-install pkg))))
