;; Add package repos
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives
               (cons "melpa" (concat proto "://melpa.org/packages/")) t))
(package-initialize)

;; Additional editing modes
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.[jt]sx?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.s?css\\'" . web-mode))
(setq-default web-mode-content-types-alist '(("jsx" . "\\.[jt]s[x]?\\'")))

(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-attr-indent-offset 2)
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil)))
(add-hook 'web-mode-hook 'my-web-mode-hook)

;; Add all themes in themes folder
(let ((basedir "~/.emacs.d/themes/"))
  (dolist (f (directory-files basedir))
    (if (and (not (or (equal f ".") (equal f "..")))
             (file-directory-p (concat basedir f)))
        (add-to-list 'custom-theme-load-path (concat basedir f)))))
;; Set default theme
(load-theme 'blackboard t)

;; Hide menu bar
(menu-bar-mode -1)
;; Hide tool bar
(tool-bar-mode -1)
;; Hide scroll bar
(scroll-bar-mode -1)

;; Display current row and column numbers
(setq-default column-number-mode t)

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

 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(completions-format (quote vertical))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (yaml-mode haskell-mode markdown-mode web-mode rjsx-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
