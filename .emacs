(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; You should just have to manually M-x install the "use-package" package.
;; Everything else should be automatically installed
(require 'use-package)

(use-package evil
  :ensure t
  :config
  (evil-mode t))

(use-package org
  :ensure t
  :config
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cc" 'org-capture)
  (global-set-key "\C-cb" 'org-switchb))

;; enable relative numbers by default for evil-mode and prog-mode
(use-package nlinum
  :ensure t)
(use-package nlinum-relative
  :ensure t
  :config
  (nlinum-relative-setup-evil)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode)
  (add-hook 'tex-mode-hook 'nlinum-relative-mode))

;; autocomplete
;(require 'auto-complete)
;(ac-config-default)
;(add-hook 'prog-mode-hook 'auto-complete-mode)

;; company-mode for autocomplete
(use-package company
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'company-mode))

;; jedi for python autocomplete
;(use-package jedi
;  :ensure t
;  :config
;  (add-hook 'python-mode-hook 'jedi:setup)
;  (setq jedi:complete-on-dot t))

;; py-yapf for python pep8 formatting
;; note: need to install yapf on system first using pip or package manager
(use-package py-yapf
  :ensure t)

;; irony mode for c++ stuff
(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package company-irony
  :ensure t
  :config
  (add-to-list 'company-backends 'company-irony))

(use-package flycheck-irony
  :ensure t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; flycheck syntax checker
(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package clang-format
  :ensure t
  :config
  (global-set-key [C-M-tab] 'clang-format-region))

;; google c/c++ style guide
(use-package google-c-style
  :ensure t
  :config
  (add-hook 'c-mode-common-hook 'google-set-c-style))

;; javascript minor mode
(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  ;; Better imenu
  (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
  ;; indent 2 spaces
  (setq js2-basic-offset 2))

;; prettier for javascript, react, jsx, etc.
(use-package prettier-js
  :ensure t)
;;(add-hook 'js2-mode-hook 'prettier-js-mode)
;;(add-hook 'web-mode-hook 'prettier-js-mode)

(use-package typescript-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
  ;; indent 2 spaces
  (setq typescript-indent-level 2))

;; markdown
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; slime mode for common lisp
(use-package slime
  :ensure t
  :config
  ; requires sbcl interpreter
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

;; paredit for parenthesis balancing of lisp
(use-package paredit
  :ensure t
  :config
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode))

;; java stuff
(use-package lsp-java
  :ensure t
  :config
  (add-hook 'java-mode-hook #'lsp))
(use-package company-lsp
  :ensure t)
; set indent to 4 spaces for java
(add-hook 'java-mode-hook (lambda ()
			    (setq c-basic-offset 4)))

;; ocaml stuff
(use-package tuareg
  :ensure t)
(use-package merlin
  :ensure t
  :config
  (autoload 'merlin-mode "merlin" "Merlin mode" t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "2b9dc43b786e36f68a9fd4b36dd050509a0e32fe3b0a803310661edb7402b8b6" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "2a9039b093df61e4517302f40ebaf2d3e95215cb2f9684c8c1a446659ee226b9" "a622aaf6377fe1cd14e4298497b7b2cae2efc9e0ce362dade3a58c16c89e089c" "3da031b25828b115c6b50bb92a117f5c0bbd3d9d0e9ba5af3cd2cb9db80db1c2" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "fd3c7bd752f48dcb7efa5f852ef858c425b1c397b73851ff8816c0580eab92f1" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "595617a3c537447aa7e76ce05c8d43146a995296ea083211225e7efc069c598f" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "e2fd81495089dc09d14a88f29dfdff7645f213e2c03650ac2dd275de52a513de" "7f89ec3c988c398b88f7304a75ed225eaac64efa8df3638c815acc563dfd3b55" default))
 '(fill-column 79)
 '(js-indent-level 2)
 '(org-agenda-files '("~/Files/org"))
 '(package-selected-packages
   '(typescript-mode gruvbox-theme scala-mode merlin lsp-java paredit slime flycheck-irony company-irony irony use-package markdown-mode+ py-yapf writeroom-mode js2-mode web-mode web-modeb prettier-js prettier-jsier arduino-mode clang-format google-c-style flycheck jedi)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; This should come after custom-safe-themes so emacs doesn't nag every time
(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-hard))


(add-to-list 'default-frame-alist
    '(font . "Inconsolata-10"))

;; disable menu bar at the top that says 'file', 'edit', etc.
(menu-bar-mode -1)
;; disable toolbar under menu bar that has icons for 'save', 'undo', etc.
(tool-bar-mode -1)
;; disable scroll bar
(scroll-bar-mode -1)

;; Configure backups
;; from: https://www.emacswiki.org/emacs/BackupDirectory
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; start server
(server-start)
