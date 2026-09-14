;;; -*- lexical-binding: t; -*-

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
  :after evil
  :config
  (evil-collection-init))

(use-package evil-matchit
  :after evil-collection
  :config
  (global-evil-matchit-mode 1))

(use-package evil-surround
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
    "."  'project-find-file ;; project related
    "ra"  'eglot-code-actions
    "pf"  'project-find-file ;; project related
    "pF"  'project-or-external-find-file
    "po"  'ff-find-other-file-other-window
    "pp" 'project-switch-project
    "pa" 'project-remember-project
    "pc" 'project-compile
    "pd" 'project-dired
    "pr"  'project-query-replace-regexp
    "ps"  'project-find-regexp
    "pS"  'project-or-external-find-regexp
    "pb" 'project-switch-to-buffer
    "pB" 'project-display-buffer ;; open buffer in another window
    "pk" 'project-kill-buffers
    "'" 'project-list-buffers
    "fr"  'recentf ;; norm
    "ff" 'find-file
    "ff" 'find-file
    "ww"  'evil-window-next ;; window
    "wv"  'evil-window-vsplit
    "ws"  'evil-window-split
    "wo"  'delete-other-windows
    "wc"  'evil-window-delete
    "wq"  'save-buffers-kill-terminal
    "qd"  'flycheck-list-errors
    "u"   'undo-tree-visualize ;; misc
    "bb"  #'ibuffer
    "SPC"   'switch-to-buffer))
