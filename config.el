;; NOTE: init.el is now generated from Emacs.org.  Please edit that file
                    ;;       in Emacs and init.el will be generated automatically!

                    ;; You will most likely need to adjust this font size for your system!
                    ;; (defvar efs/default-font-size 180)
                    ;; (defvar efs/default-variable-font-size 180)

                    ;; Make frame transparency overridable
 (defvar efs/frame-transparency '(100 . 100))
  ;; You will most likely need to adjust this font size for your system!
(defvar efs/default-font-size 250)
(defvar efs/default-variable-font-size 250)



  (set-face-attribute 'default nil :font "Fira Code Retina" :height efs/default-font-size)

  ;; Set the fixed pitch face
  (set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height efs/default-font-size)

  ;; Set the variable pitch face
  (set-face-attribute 'variable-pitch nil :font "Cantarell" :height efs/default-variable-font-size :weight 'regular)



                  ;; Initialize package sources
                  (require 'package)

                  (setq package-archives '(("melpa" . "https://melpa.org/packages/")
                                           ("org" . "https://orgmode.org/elpa/")
                                           ("elpa" . "https://elpa.gnu.org/packages/")))

                  (package-initialize)
                  (unless package-archive-contents
                    (package-refresh-contents))

                    ;; Initialize use-package on non-Linux platforms
                  (unless (package-installed-p 'use-package)
                    (package-install 'use-package))

                  (require 'use-package)
                  (setq use-package-always-ensure t)



                (setq inhibit-startup-message t)

                (scroll-bar-mode -1)        ; Disable visible scrollbar
                (tool-bar-mode 1)          ; Disable the toolbar
                (tooltip-mode -1)           ; Disable tooltips
                (set-fringe-mode 10)        ; Give some breathing room

                (menu-bar-mode 1)            ; Disable the menu bar

                ;; Set up the visible bell
                (setq visible-bell t)

                (column-number-mode)
                (global-display-line-numbers-mode t)

                ;; Set frame transparency
                (set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
                (add-to-list 'default-frame-alist `(alpha . ,efs/frame-transparency))
                (set-frame-parameter (selected-frame) 'fullscreen 'maximized)
                (add-to-list 'default-frame-alist '(fullscreen . maximized))

                ;; Disable line numbers for some modes
                (dolist (mode '(org-mode-hook
                                term-mode-hook
                                shell-mode-hook
                                treemacs-mode-hook
                                eshell-mode-hook))
                  (add-hook mode (lambda () (display-line-numbers-mode 0))))



              (set-face-attribute 'default nil :font "Fira Code Retina" :height efs/default-font-size)

              ;; Set the fixed pitch face
              (set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height efs/default-font-size)

              ;; Set the variable pitch face
              (set-face-attribute 'variable-pitch nil :font "Cantarell" :height efs/default-variable-font-size :weight 'regular)



            ;; Make ESC quit prompts
            (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

            (use-package general
              :config
              (general-create-definer rune/leader-keys
                :keymaps '(normal insert visual emacs)
                :prefix "SPC"
                :global-prefix "C-SPC")

              (rune/leader-keys
                "t"  '(:ignore t :which-key "toggles")
                "tt" '(counsel-load-theme :which-key "choose theme")))

            (use-package evil
              :init
              (setq evil-want-integration t)
              (setq evil-want-keybinding nil)
              (setq evil-want-C-u-scroll t)
              (setq evil-want-C-i-jump nil)
              :config
              (evil-mode 1)
              (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
              (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

              ;; Use visual line motions even outside of visual-line-mode buffers
              (evil-global-set-key 'motion "j" 'evil-next-visual-line)
              (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

              (evil-set-initial-state 'messages-buffer-mode 'normal)
              (evil-set-initial-state 'dashboard-mode 'normal))

            (use-package evil-collection
              :after evil
              :config
              (evil-collection-init))



          (use-package command-log-mode)


        (use-package which-key
          :init (which-key-mode)
          :diminish which-key-mode
          :config
          (setq which-key-idle-delay 1))

        (use-package ivy
          :diminish
          :bind (("C-s" . swiper)
                 :map ivy-minibuffer-map
                 ("TAB" . ivy-alt-done)
                 ("C-l" . ivy-alt-done)
                 ("C-j" . ivy-next-line)
                 ("C-k" . ivy-previous-line)
                 :map ivy-switch-buffer-map
                 ("C-k" . ivy-previous-line)
                 ("C-l" . ivy-done)
                 ("C-d" . ivy-switch-buffer-kill)
                 :map ivy-reverse-i-search-map
                 ("C-k" . ivy-previous-line)
                 ("C-d" . ivy-reverse-i-search-kill))
          :config
          (ivy-mode 1))

        (use-package ivy-rich
          :init
          (ivy-rich-mode 1))

        (use-package counsel
          :bind (("C-M-j" . 'counsel-switch-buffer)
                 :map minibuffer-local-map
                 ("C-r" . 'counsel-minibuffer-history))
          :custom
          (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
          :config
          (counsel-mode 1))

        (use-package helpful
          :custom
          (counsel-describe-function-function #'helpful-callable)
          (counsel-describe-variable-function #'helpful-variable)
          :bind
          ([remap describe-function] . counsel-describe-function)
          ([remap describe-command] . helpful-command)
          ([remap describe-variable] . counsel-describe-variable)
          ([remap describe-key] . helpful-key))

        (use-package hydra)

        (defhydra hydra-text-scale (:timeout 4)
          "scale text"
          ("j" text-scale-increase "in")
          ("k" text-scale-decrease "out")
          ("f" nil "finished" :exit t))

        (rune/leader-keys
          "ts" '(hydra-text-scale/body :which-key "scale text"))


      (defun efs/lsp-mode-setup ()
        (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
        (lsp-headerline-breadcrumb-mode))

      (use-package lsp-mode
        :commands (lsp lsp-deferred)
        :hook (lsp-mode . efs/lsp-mode-setup)
        :init
        (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
        :config
        (lsp-enable-which-key-integration t))


    (use-package lsp-ui
      :hook (lsp-mode . lsp-ui-mode)
      :custom
      (lsp-ui-doc-position 'bottom))

    (use-package lsp-treemacs
      :after lsp)

    (use-package lsp-ivy)

    (use-package dap-mode
      ;; Uncomment the config below if you want all UI panes to be hidden by default!
      ;; :custom
      ;; (lsp-enable-dap-auto-configure nil)
      ;; :config
      ;; (dap-ui-mode 1)

      :config
      ;; Set up Node debugging
      (require 'dap-node)
      (dap-node-setup) ;; Automatically installs Node debug adapter if needed

      ;; Bind `C-c l d` to `dap-hydra` for easy access
      (general-define-key
        :keymaps 'lsp-mode-map
        :prefix lsp-keymap-prefix
        "d" '(dap-hydra t :wk "debugger")))


    ;; Make ESC quit prompts
    (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

    (use-package general
      :config
      (general-create-definer rune/leader-keys
        :keymaps '(normal insert visual emacs)
        :prefix "SPC"
        :global-prefix "C-SPC")

      (rune/leader-keys
        "t"  '(:ignore t :which-key "toggles")
        "tt" '(counsel-load-theme :which-key "choose theme")))

    (use-package evil
      :init
      (setq evil-want-integration t)
      (setq evil-want-keybinding nil)
      (setq evil-want-C-u-scroll t)
      (setq evil-want-C-i-jump nil)
      :config
      (evil-mode 1)
      (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
      (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

      ;; Use visual line motions even outside of visual-line-mode buffers
      (evil-global-set-key 'motion "j" 'evil-next-visual-line)
      (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

      (evil-set-initial-state 'messages-buffer-mode 'normal)
      (evil-set-initial-state 'dashboard-mode 'normal))

    (use-package evil-collection
      :after evil
      :config
      (evil-collection-init))


                  ;;original


(use-package doom-themes
  :init (load-theme 'doom-dracula t))


(use-package all-the-icons
  :ensure t)

(use-package doom-themes
  :ensure t
  :init
  ;; (load-theme 'doom-one t)
  (doom-themes-treemacs-config)
  (setq neo-global--window nil)
  (setq hl-line-sticky-flag nil)
  (setq neo-vc-integration nil)
  (setq neotree-dir-button-keymap nil)
  (setq neotree-file-button-keymap nil)
  (setq neo-path--file-short-name nil)
  (setq neo-vc-for-node nil)
  (setq neo-buffer--insert-fold-symbol nil)
  (setq neo-buffer--node-list-set nil)
  (setq neo-buffer--newline-and-begin nil)
  (setq neo-global--select-window nil)
  (setq neo-buffer--insert-file-entry nil)
  (setq neo-buffer--insert-dir-entry nil)
  (setq neo-buffer--insert-root-entry nil))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package helm
:ensure t
:init
(
 helm-mode 1)
:bind
  ("C-x C-f" . 'helm-find-files)
  ("C-x C-b" . 'helm-buffers-list)
  ("M-x" . 'helm-M-x))
(helm-autoresize-mode 1)

(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)

(use-package company
   :ensure t
   :config
   (setq company-idle-delay 0)
   (setq company-minimum-prefix-length 2))
 (with-eval-after-load 'company
   (define-key company-active-map (kbd "M-n") nil)
   (define-key company-active-map (kbd "M-p") nil)
   (define-key company-active-map (kbd "C-n") #'company-select-next)
   (define-key company-active-map (kbd "C-p") #'company-select-previous)
   (define-key company-active-map (kbd "<tab>") #'company-abort))
 (add-hook 'c++-mode-hook 'yas-minor-mode)
 (add-hook 'c-mode-hook 'yas-minor-mode)
 (with-eval-after-load 'company
   (add-hook 'c++-mode-hook 'company-mode)
   (add-hook 'c-mode-hook 'company-mode))
 (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
 (add-hook 'emacs-lisp-mode-hook 'yas-minor-mode)
 (add-hook 'emacs-lisp-mode-hook 'company-mode)
 (setq lsp-completion-provider :capf)
 (defun check-expansion ()
     (save-excursion
       (if (looking-at "\\_>") t
         (backward-char 1)
         (if (looking-at "\\.") t
           (backward-char 1)
           (if (looking-at "->") t nil)))))
   (defun do-yas-expand ()
     (let ((yas/fallback-behavior 'return-nil))
       (yas/expand)))
   (defun tab-indent-or-complete ()
     (interactive)
     (if (minibufferp)
         (minibuffer-complete)
       (if (or (not yas/minor-mode)
               (null (do-yas-expand)))
           (if (check-expansion)
               (company-complete-common)
             (indent-for-tab-command)))))
 (global-set-key [tab] 'tab-indent-or-complete)
 (add-hook 'after-init-hook 'global-company-mode)

(use-package yasnippet
    :ensure t
    :config
      (yas-reload-all))
  (define-key global-map (kbd "C-c C-y") 'yas-new-snippet)
  (defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))
  (add-hook 'org-mode-hook
  (lambda ()
  (make-variable-buffer-local 'yas/trigger-key)
  (setq yas/trigger-key [tab])
  (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
  (define-key yas/keymap [tab] 'yas/next-field)))
(use-package yasnippet-snippets :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(use-package quickrun
  :ensure t
  :bind("<f5>". 'quickrun-shell))

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         26)
	  
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(electric-pair-mode 1)
(setq electric-pair-pairs
'(
  (?\" . ?\")
  (?\' . ?\')
  (?\{ . ?\})))

(defun move-line (n)
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    (forward-line -1)
    (forward-char col)))
(defun move-line-up (n)
  (interactive "p")
  (move-line (if (null n) -1 (- n))))
(defun move-line-down (n)
  (interactive "p")
  (move-line (if (null n) 1 n)))
(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

(show-paren-mode 1)

(global-set-key (kbd "C-h") 'kill-whole-line)

(add-hook 'prog-mode-hook 'linum-mode)

(use-package lsp-mode
  :commands lsp
  :ensure t
  :hook(c-mode . lsp))

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
			  (bookmarks . 5)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-startup-banner "~/.emacs.d/CondorEmacs.png")
  (setq dashboard-banner-logo-title "Welcome to Condor Emacs!")
  (setq dashboard-set-navigator t)
  (setq dashboard-navigator-buttons
	`(((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
	    "Homepage"
	    "Browse homepage"
	    (lambda (&rest _) (browse-url "https://github.com/apemangr/Condor-Emacs/")))

	   (,(all-the-icons-faicon "archive" :height 1.1 :v-adjust 0.0)
	    "Update Packages"
	    "Click to updates your packages"
	    (lambda (&rest _) (auto-package-update-now)))

	   (,(all-the-icons-octicon "gear" :height 1.1 :v-adjust 0.0)
	    "Configuration"
	    "Click to config Condor Emacs"
	    (lambda (&rest _) (find-file "~/.emacs.d/config.org")))))))

(setq scroll-step 1)
(setq scroll-margin 1)
(setq scroll-conservatively 101)
(setq scroll-up-aggressively 0.01)
(setq scroll-down-aggressively 0.01)
(setq auto-window-vscroll nil)
(setq fast-but-imprecise-scrolling nil)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
;; Horizontal Scroll
(setq hscroll-step 1)
(setq hscroll-margin 1)

(setq org-startup-indented t
      org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
      org-ellipsis "  " ;; folding symbol
      org-pretty-entities t
      org-hide-emphasis-markers t
      ;; show actually italicized text instead of /italicized text/
      org-agenda-block-separator ""
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t)

(add-hook 'org-mode-hook (lambda ()
   "Beautify Org Checkbox Symbol"
   (push '("[ ]" .  "☐") prettify-symbols-alist)
   (push '("[X]" . "☑" ) prettify-symbols-alist)
   (push '("[-]" . "❍" ) prettify-symbols-alist)
   (push '("#+BEGIN_SRC" . "↦" ) prettify-symbols-alist)
   (push '("#+END_SRC" . "⇤" ) prettify-symbols-alist)
   (push '("#+BEGIN_EXAMPLE" . "↦" ) prettify-symbols-alist)
   (push '("#+END_EXAMPLE" . "⇤" ) prettify-symbols-alist)
   (push '("#+BEGIN_QUOTE" . "↦" ) prettify-symbols-alist)
   (push '("#+END_QUOTE" . "⇤" ) prettify-symbols-alist)
   (push '("#+begin_quote" . "↦" ) prettify-symbols-alist)
   (push '("#+end_quote" . "⇤" ) prettify-symbols-alist)
   (push '("#+begin_example" . "↦" ) prettify-symbols-alist)
   (push '("#+end_example" . "⇤" ) prettify-symbols-alist)
   (push '("#+begin_src" . "↦" ) prettify-symbols-alist)
   (push '("#+end_src" . "⇤" ) prettify-symbols-alist)
   (prettify-symbols-mode)))

(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  ;; (python-shell-interpreter "python3")
  ;; (dap-python-executable "python3")
  (dap-python-debugger 'debugpy)
  :config
  (require 'dap-python))

(use-package goto-chg :ensure t)
 (global-set-key (kbd "s-\[") 'goto-last-change)
 (global-set-key (kbd "s-\]") 'goto-last-change-reverse)
  (global-auto-revert-mode t)
(use-package cmake-ide :ensure t)
(cmake-ide-setup)
    (use-package flycheck
      :ensure t
      :init (global-flycheck-mode))





    (use-package pyvenv
      :config
      (pyvenv-mode 1))





    (use-package projectile
      :diminish projectile-mode
      :config (projectile-mode)
      :custom ((projectile-completion-system 'ivy))
      :bind-keymap
      ("C-c p" . projectile-command-map)
      :init
      ;; NOTE: Set this to the folder where you keep your Git repos!
      (when (file-directory-p "~/Projects/Code")
        (setq projectile-project-search-path '("~/Projects/Code")))
      (setq projectile-switch-project-action #'projectile-dired))

    (use-package counsel-projectile
      :config (counsel-projectile-mode))

    (setq-default dotspacemacs-configuration-layers '(
      (python :variables python-formatter 'yapf)))
      (setq-default dotspacemacs-configuration-layers '(
      (python :variables python-format-on-save t)))
      (setq-default dotspacemacs-configuration-layers '(
      (python :variables python-save-before-test nil)))
      (setq-default dotspacemacs-configuration-layers '(
        (python :variables python-fill-column 99)))
        (setq-default dotspacemacs-configuration-layers
      '((python :variables python-sort-imports-on-save t)))


    (use-package magit
      :custom
      (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

    ;; NOTE: Make sure to configure a GitHub token before using this package!
    ;; - https://magit.vc/manual/forge/Token-Creation.html#Token-Creation
    ;; - https://magit.vc/manual/ghub/Getting-Started.html#Getting-Started
    ;(use-package forge)



    (use-package evil-nerd-commenter
      :bind ("M-/" . evilnc-comment-or-uncomment-lines))



    (use-package rainbow-delimiters
      :hook (prog-mode . rainbow-delimiters-mode))



    (use-package term
      :config
      (setq explicit-shell-file-name "bash") ;; Change this to zsh, etc
      ;;(setq explicit-zsh-args '())         ;; Use 'explicit-<shell>-args for shell-specific args

      ;; Match the default Bash shell prompt.  Update this if you have a custom prompt
      (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))



    (use-package vterm
      :commands vterm
      :config
      (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")  ;; Set this to match your custom shell prompt
      ;;(setq vterm-shell "zsh")                       ;; Set this to customize the shell to launch
      (setq vterm-max-scrollback 10000))


    (defun efs/configure-eshell ()
      ;; Save command history when commands are entered
      (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)

      ;; Truncate buffer for performance
      (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

      ;; Bind some useful keys for evil-mode
      (evil-define-key '(normal insert visual) eshell-mode-map (kbd "C-r") 'counsel-esh-history)
      (evil-define-key '(normal insert visual) eshell-mode-map (kbd "<home>") 'eshell-bol)
      (evil-normalize-keymaps)

      (setq eshell-history-size         10000
            eshell-buffer-maximum-lines 10000
            eshell-hist-ignoredups t
            eshell-scroll-to-bottom-on-input t))

    (use-package eshell-git-prompt)

    (use-package eshell
      :hook (eshell-first-time-mode . efs/configure-eshell)
      :config

      (with-eval-after-load 'esh-opt
        (setq eshell-destroy-buffer-when-process-dies t)
        (setq eshell-visual-commands '("htop" "zsh" "vim")))

      (eshell-git-prompt-use-theme 'powerline))



    ;; Make ESC quit prompts
    (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

    (use-package general
      :config
      (general-create-definer rune/leader-keys
        :keymaps '(normal insert visual emacs)
        :prefix "SPC"
        :global-prefix "C-SPC")

      (rune/leader-keys
        "t"  '(:ignore t :which-key "toggles")
        "tt" '(counsel-load-theme :which-key "choose theme")))

    (use-package evil
      :init
      (setq evil-want-integration t)
      (setq evil-want-keybinding nil)
      (setq evil-want-C-u-scroll t)
      (setq evil-want-C-i-jump nil)
      :config
      (evil-mode 1)
      (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
      (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

      ;; Use visual line motions even outside of visual-line-mode buffers
      (evil-global-set-key 'motion "j" 'evil-next-visual-line)
      (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

      (evil-set-initial-state 'messages-buffer-mode 'normal)
      (evil-set-initial-state 'dashboard-mode 'normal))

    (use-package evil-collection
      :after evil
      :config
      (evil-collection-init))
    (add-hook 'python-mode-hook 'anaconda-mode)

    (use-package nim-mode :ensure t)
    ;; The `nimsuggest-path' will be set to the value of
    ;; (executable-find "nimsuggest"), automatically.
    (setq nimsuggest-path "/usr/local/bin/nimsuggest")

    (defun my--init-nim-mode ()
      "Local init function for `nim-mode'."

      ;; Just an example, by default these functions are
      ;; already mapped to "C-c <" and "C-c >".
      (local-set-key (kbd "M->") 'nim-indent-shift-right)
      (local-set-key (kbd "M-<") 'nim-indent-shift-left)

      ;; Make files in the nimble folder read only by default.
      ;; This can prevent to edit them by accident.
      (when (string-match "/\.nimble/" (or (buffer-file-name) "")) (read-only-mode 1))

      ;; If you want to experiment, you can enable the following modes by
      ;; uncommenting their line.
      (nimsuggest-mode 1)
      ;; Remember: Only enable either `flycheck-mode' or `flymake-mode' at the same time.
      (flycheck-mode 1)
      ;; (flymake-mode 1)

      ;; The following modes are disabled for Nim files just for the case
      ;; that they are enabled globally.
      ;; Anything that is based on smie can cause problems.
      (auto-fill-mode 0)
      (electric-indent-local-mode 0)
    )

    (add-hook 'nim-mode-hook 'my--init-nim-mode)
