;;; -*- lexical-binding: t; -*-

;;; Code:
(add-to-list 'load-path "~/.config/emacs/pkg/")
(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font-15"))
(make-directory (expand-file-name "~/.local/state/emacs/auto-saves/") t)

(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.local/state/emacs/auto-saves/" ) t)))
(setq custom-file "~/.config/emacs/custom.el")
(load custom-file 'noerror)

(dolist (mode '(vterm-mode-hook term-mode-hook shell-mode-hook eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(when (memq window-system '(mac ns x pgtk))
  (exec-path-from-shell-initialize))
(when (daemonp)
  (exec-path-from-shell-initialize))

(load-file "~/.config/emacs/pkg/ui.el")
(load-file "~/.config/emacs/pkg/evil.el")
(load-file "~/.config/emacs/pkg/completion.el")
(load-file "~/.config/emacs/pkg/qol.el")

(use-package magit
  :ensure t
  :after evil-collection)
;;; init.el ends here
