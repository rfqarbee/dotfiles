;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

(add-to-list 'load-path "~/.config/emacs/yuh/")
(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font-15"))
(setq recentf-save-file "~/.local/state/emacs/recentf.eld")
(setq make-backup-files nil)
(make-directory (expand-file-name "~/.local/state/emacs/auto-save-list/") t)
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.local/state/emacs/auto-save-list/" ) t)))

(menu-bar-mode -1)
(recentf-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(dolist (mode '(term-mode-hook shell-mode-hook eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq custom-file "~/.config/emacs/custom.el")
(load custom-file 'noerror)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (load-theme 'doom-one t))

(use-package diminish
  :ensure t)

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump t)
  (setq evil-insert-state-cursor 'box)
  (setq select-enable-clipboard nil)
  (setq select-enable-primary nil)
  :config
  (evil-define-key '(normal visual operator) 'global "gp" (kbd "\"+p"))
  (evil-define-key '(normal visual operator) 'global "gy" "\"+y")
  (evil-define-key 'normal 'dired-mode-map "Y" (lambda ()
						 (interactive)
						 (dired-copy-filename-as-kill 0)))
  (evil-global-set-key 'normal "-" 'dired-jump)
  (evil-global-set-key 'normal "gs" 'magit)
  (evil-global-set-key 'visual "gc" 'comment-dwim)
  (evil-global-set-key 'normal "gcc" 'comment-line)
  (evil-global-set-key 'visual (kbd "C-p") "\"_dP")
  (evil-global-set-key 'insert (kbd "C-y") nil)
  (evil-global-set-key 'motion "L" 'evil-end-of-line-or-visual-line)
  (evil-global-set-key 'motion "H" 'evil-beginning-of-line)
  (evil-global-set-key 'motion (kbd "C-d") (lambda () (interactive) (evil-scroll-down nil) (evil-scroll-line-to-center nil)))
  (evil-global-set-key 'motion (kbd "C-u") (lambda () (interactive) (evil-scroll-up nil) (evil-scroll-line-to-center nil)))
  (evil-global-set-key 'motion (kbd "C-f") (lambda () (interactive) (evil-scroll-page-down 1) (evil-scroll-line-to-center nil)))
  (evil-global-set-key 'motion (kbd "C-b") (lambda () (interactive) (evil-scroll-page-up 1) (evil-scroll-line-to-center nil)))

  (evil-set-initial-state 'doc-view-mode 'motion)
  (evil-set-initial-state 'projectile-search-mode 'emacs)
  (evil-mode 1))

(use-package evil-collection
  :ensure t
  :diminish evil-collection-unimpaired-mode
  :after evil
  :config
  (evil-collection-init))

(use-package evil-matchit
  :diminish
  :after evil-collection
  :config
  (global-evil-matchit-mode 1))

(use-package evil-surround
  :diminish
  :after evil-collection
  :config
  (global-evil-surround-mode 1))

(use-package general
  :ensure t
  :after evil-collection
  :config
  (general-evil-setup)
  (general-create-definer v/leader
    :states '(normal motion emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")

  (v/leader
    "SPC"  'project-find-file ;; project related
    "pf"  'project-or-external-find-file
    "pp" 'project-switch-project
    "pc" 'project-compile
    "pd" 'project-dired
    "pr"  'project-query-replace-regexp
    "pg"  'project-find-regexp
    "pG"  'project-or-external-find-regexp
    "pb" 'project-switch-to-buffer
    "ps" 'project-display-buffer ;; open buffer in another window
    "pk" 'project-kill-buffers
    "po"  'ff-find-other-file-other-window
    "'" 'project-list-buffers
    "fr"  'recentf ;; norm
    "ff" 'find-file
    "ww"  'evil-window-next ;; window
    "wv"  'evil-window-vsplit
    "ws"  'evil-window-split
    "wc"  'delete-other-windows
    "wq"  'save-buffers-kill-terminal
    "qd"  'flycheck-list-errors
    "u"   'undo-tree-visualize ;; misc
    "bB"  #'ibuffer
    "bb"   'switch-to-buffer))

(use-package undo-tree
  :diminish
  :config
  (global-undo-tree-mode 1)
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.local/state/emacs/undo-hist"))))

(use-package magit
  :ensure t
  :after evil-collection)

(use-package flycheck
  :ensure t
  :diminish
  :hook (
	 (after-init . global-flycheck-mode)
	 (after-init . global-flycheck-annotate-mode)
	 )
  :config
  (setq flycheck-annotate-current-line-style 'eol)
  (setq flycheck-annotate-other-lines-style 'nil)
  (global-flycheck-eglot-mode 1))

(use-package vertico
  :ensure t
  :bind (:map vertico-map ("C-y" . vertico-insert))
  :init
  (vertico-mode 1))

(use-package corfu
  :ensure t
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-trigger ".")
  (corfu-preview-current nil)
  (corfu-auto-delay 0.2)
  (corfu-quit-no-match t)
  (corfu-preselect 'first)
  :bind
  (:map corfu-map
        ("C-y" . corfu-insert)
        ("C-c" . corfu-quit))
  :init
  (global-corfu-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil)
  (completion-pcm-leading-wildcard t))

(use-package marginalia
  :ensure t
  :after vertico
  :init
  (marginalia-mode 1))

(use-package cape
  :ensure t
  :bind ("M-p" . cape-prefix-map)
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file))

;; formatting
(use-package apheleia
  :ensure t
  :diminish
  :config
  (apheleia-global-mode 1))

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode 1))

(use-package vterm
  :ensure t)
