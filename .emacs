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
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)

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
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("7f89ec3c988c398b88f7304a75ed225eaac64efa8df3638c815acc563dfd3b55" default)))
 '(fill-column 79)
 '(js-indent-level 2)
 '(org-agenda-files (quote ("~/Files/org")))
 '(package-selected-packages
   (quote
    (py-yapf writeroom-mode js2-mode web-mode web-modeb prettier-js prettier-jsier arduino-mode clang-format google-c-style flycheck jedi gruvbox-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'gruvbox)

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
