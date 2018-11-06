(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(require 'evil)
(evil-mode t)

;; enable relative numbers by default for evil-mode and prog-mode
(require 'nlinum)
(require 'nlinum-relative)
(nlinum-relative-setup-evil)
(add-hook 'prog-mode-hook 'nlinum-relative-mode)

;; autocomplete
(require 'auto-complete)

;; jedi for python autocomplete
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

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
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (js2-mode web-mode web-modeb prettier-js prettier-jsier arduino-mode clang-format google-c-style flycheck jedi gruvbox-theme evil))))
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

;; start server
(server-start)
