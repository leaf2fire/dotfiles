(add-to-list 'load-path "~/.emacs.d/config")
(add-to-list 'load-path "~/.emacs.d/config/modes")

(load-library "package-config")
(load-library "ui-config")
(load-library "web-mode-config")
(load-library "other-config")

(use-package yaml-mode)
(use-package markdown-mode)
(use-package haskell-mode)

(load-library "theme-config")

;; Set custom file so emacs doesn't automatically edit init.el
(setq custom-file "~/.emacs.d/custom-added.el")
(if (file-exists-p custom-file) (load custom-file))

(shell)
