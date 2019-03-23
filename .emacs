(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(require 'evil)
(evil-mode t)

(require 'org)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

;; enable relative numbers by default for evil-mode and prog-mode
(require 'nlinum)
(require 'nlinum-relative)
(nlinum-relative-setup-evil)
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(add-hook 'tex-mode-hook 'nlinum-relative-mode)

;; autocomplete
(require 'auto-complete)
(ac-config-default)
(add-hook 'prog-mode-hook 'auto-complete-mode)

;; jedi for python autocomplete
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;; py-yapf for python pep8 formatting
;; note: need to install yapf on system first using pip or package manager
(require 'py-yapf)

;; irony mode for c++ stuff
(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; flycheck syntax checker
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; google c/c++ style guide
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

;; javascript minor mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

;; prettier for javascript, react, jsx, etc.
(require 'prettier-js)
;;(add-hook 'js2-mode-hook 'prettier-js-mode)
;;(add-hook 'web-mode-hook 'prettier-js-mode)

;; markdown
(require 'markdown-mode)
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2a9039b093df61e4517302f40ebaf2d3e95215cb2f9684c8c1a446659ee226b9" "a622aaf6377fe1cd14e4298497b7b2cae2efc9e0ce362dade3a58c16c89e089c" "3da031b25828b115c6b50bb92a117f5c0bbd3d9d0e9ba5af3cd2cb9db80db1c2" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "fd3c7bd752f48dcb7efa5f852ef858c425b1c397b73851ff8816c0580eab92f1" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "595617a3c537447aa7e76ce05c8d43146a995296ea083211225e7efc069c598f" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "e2fd81495089dc09d14a88f29dfdff7645f213e2c03650ac2dd275de52a513de" "7f89ec3c988c398b88f7304a75ed225eaac64efa8df3638c815acc563dfd3b55" default)))
 '(fill-column 79)
 '(js-indent-level 2)
 '(org-agenda-files (quote ("~/Files/org")))
 '(package-selected-packages
   (quote
    (irony use-package markdown-mode+ py-yapf writeroom-mode js2-mode web-mode web-modeb prettier-js prettier-jsier arduino-mode clang-format google-c-style flycheck jedi gruvbox-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'gruvbox-dark-hard)

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
