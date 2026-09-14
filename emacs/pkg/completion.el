;;; -*- lexical-binding: t; -*-
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
  (add-hook 'completion-at-point-functions #'yasnippet-capf)
  (add-hook 'completion-at-point-functions #'cape-file))

(use-package eglot
  :ensure nil
  ;; :hook
  ;; (add-hook 'eglot-managed-mode-hook
  ;;           (lambda ()
  ;;             (remove-hook 'eldoc-documentation-functions #'eglot-signature-help-provider t)))
  :config
  (setq eldoc-display-functions '(eldoc-display-in-buffer))
  (add-to-list 'eglot-server-programs '((typescript-ts-mode) . ("typescript-language-server" "--stdio")))
  )

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))
