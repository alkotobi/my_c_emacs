(eval-after-load 'autoinsert
'(define-auto-insert '(nim-mode . "Nim skeleton")
   '(
     "#------------------------------------------------------\n "
     "# " (file-name-nondirectory (buffer-file-name)) \n
     "#" \n
     "# By Merhab Noureddine\n"
     "# On " (format-time-string "%A, %e %B %Y.") \n
     "#" >  \n
     "#------------------------------------------------------" \n
     \n)))

(defun mn-nim-compile()
  (interactive)
  (let* ((src (file-name-nondirectory (buffer-file-name)))
         (exe (file-name-sans-extension src)))
    (compile (concat "nim c -r --debugger:native --verbosity\:0 --excessiveStackTrace\:on " "./" src ))))
(add-hook 'nim-mode-hook
          (lambda () (local-set-key (kbd "<f9>") #'mn-nim-compile)))

(require 'ob-nim)
(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t) (org . t) (nim . t)))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-agenda-files '("~/dev/orgs"
                         "~/dev/orgs/brain"))

(use-package org-auto-tangle
 :defer t
 :hook (org-mode . org-auto-tangle-mode)
 :config
 (setq org-auto-tangle-default t))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/dev/orgs/roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))
