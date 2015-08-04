;; "org" because C-h f org-mode RET says that org-mode is defined in org.el
(eval-after-load "org"
  '(progn
     (define-key org-mode-map (kbd "<RET>") 'org-insert-heading)
     (define-key org-mode-map (kbd "S-<RET>") 'org-insert-heading-respect-content)
     (define-key org-mode-map (kbd "✠") 'org-insert-heading-respect-content)
     ))

;; Convert the table syntax from orgtbl to markdown
;; http://emacs.stackexchange.com/questions/4276/correct-markdown-format-tables-with-orgtbl-mode/5319#5319
(defun orgtbl-to-gfm (table params)
  "Convert the Orgtbl mode TABLE to GitHub Flavored Markdown."
  (let* ((alignment (mapconcat (lambda (x) (if x "|--:" "|---"))
                               org-table-last-alignment ""))
         (params2
           (list
             :splice t
             :hline (concat alignment "|")
             :lstart "| " :lend " |" :sep " | ")))
    (orgtbl-to-generic table (org-combine-plists params2 params))))

(defun stag-insert-org-to-md-table (table-name)
  (interactive "*sEnter table name: ")
  (insert "<!---
          #+ORGTBL: SEND " table-name " orgtbl-to-gfm

          -->
          <!--- BEGIN RECEIVE ORGTBL " table-name " -->
          <!--- END RECEIVE ORGTBL " table-name " -->")
          (previous-line)
          (previous-line)
          (previous-line))
