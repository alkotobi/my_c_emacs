;; -*- lexical-binding: t; -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   '("234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "745d03d647c4b118f671c49214420639cb3af7152e81f132478ed1c649d4597d" "b0e446b48d03c5053af28908168262c3e5335dcad3317215d9fdeb8bac5bacf9" "e8df30cd7fb42e56a4efc585540a2e63b0c6eeb9f4dc053373e05d774332fc13" "b186688fbec5e00ee8683b9f2588523abdf2db40562839b2c5458fcfb322c8a4" "5784d048e5a985627520beb8a101561b502a191b52fa401139f4dd20acb07607" "97db542a8a1731ef44b60bc97406c1eb7ed4528b0d7296997cbb53969df852d6" "613aedadd3b9e2554f39afe760708fc3285bf594f6447822dd29f947f0775d6c" "f91395598d4cb3e2ae6a2db8527ceb83fed79dbaf007f435de3e91e5bda485fb" default))
 '(frame-resize-pixelwise t)
 '(helm-minibuffer-history-key "M-p")
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(company-box cmake-ide package-install yasnippet-snippets nim-mode dired-hide-dotfiles dired-open all-the-icons-dired dired-single eshell-git-prompt vterm rainbow-delimiters evil-nerd-commenter forge counsel-projectile projectile python-mode anaconda-mode jedi-core pyvenv pyenv-mode counsel-world-clock neotree sr-speedbar cmake-mode magit exec-path-from-shell counsel-etags lsp-treemacs treemacs org-bullets company-lsp helm-lsp doom-modeline dashboard quickrun yasnippet company helm use-package async))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(warning-suppress-log-types
   '(((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))))
 '(warning-suppress-types
   '(((package reinitialization))
     ((package reinitialization))
     ((package reinitialization)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(package-initialize)
(require 'package)
(setq package-enable-at-startup nil)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
