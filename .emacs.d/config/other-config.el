;; Set fill-column value to 80 instead of default 70
(setq-default fill-column 80)

;; Adjust default font size
(set-face-attribute 'default nil :height 100)

;; Strip trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Distinguish tabs and trailing whitespace
(require 'whitespace)
(setq-default whitespace-style '(face tabs spaces tab-mark))
(setq-default whitespace-space-regexp "\\( +$\\)")
(global-whitespace-mode 1)

;; No tabs when auto-indenting
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default tab-stop-list '(0 2))
(setq-default js-indent-level 2)
