;;; -*- lexical-binding: t; -*-

(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (load-theme 'doom-ayu-mirage t))
;; (load-theme 'doom-spacegrey t))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-icon nil)
  (setq doom-modeline-buffer-file-name-style 'relative-from-project))
