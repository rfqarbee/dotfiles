;;; -*- lexical-binding: t; -*-

(use-package undo-tree
  :config
  (global-undo-tree-mode 1)
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.local/state/emacs/undo-hist"))))

(use-package flycheck
  :ensure t
  :hook (
	 (after-init . global-flycheck-mode)
	 (after-init . global-flycheck-annotate-mode)
	 )
  :config
  (setq flycheck-annotate-current-line-style 'eol)
  (setq flycheck-annotate-other-lines-style 'nil)
  (global-flycheck-eglot-mode 1))

;; formatting
(use-package apheleia
  :ensure t
  ;; :diminish
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
