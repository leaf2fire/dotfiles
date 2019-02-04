;;;; Description: My Emacs init file
;;;; Author: Evan Lee

(defun myconfig-install-package-if-missing-p (package)
  "Installs the specified package if it's missing."
  (unless (package-installed-p package)
    (package-install package))
  )

(defun myconfig-package-management-p ()
  "Load package archives (i.e. melpa) and use 'use-package'."
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (package-initialize)

  (myconfig-install-package-if-missing-p 'use-package)
  (require 'use-package)
  ;; Packages are automatically installed if missing.
  (setq use-package-always-ensure t)
  )

(defun myconfig-minimal-ui-p ()
  "Minimal yet information rich UI."
  ;; Hide menu bar
  (menu-bar-mode -1)
  ;; Hide tool bar
  (tool-bar-mode -1)
  ;; Hide scroll bar
  (scroll-bar-mode -1)
  ;; Display current row and column numbers
  (setq-default column-number-mode t)
  ;; Don't show welcome screen
  (setq inhibit-startup-screen t)
  )

(defun myconfig-web-mode-hook-p ()
  "My web-mode-hook setup."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-attr-indent-offset 2)
  ;; TODO: There is probably a more compact way of saying this.
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
  )

(defun myconfig-web-mode-p ()
  "My configuration for web-mode."
  (use-package web-mode
    :mode ("\\.[jt]sx?\\'"
           "\\.json\\'"
           "\\.s?css\\'")
    :config
    (setq-default web-mode-content-types-alist '(("jsx" . "\\.[jt]s[x]?\\'")))
    (add-hook 'web-mode-hook 'myconfig-web-mode-hook-p)
    )
  )

;;; TODO: Separate out pdf and tex stuff. Dependencies?
(defun myconfig-latex-p ()
  "LaTeX configurations."
  (use-package pdf-tools
    :config
    (pdf-tools-install)
    (unbind-key "C-c C-c" pdf-view-mode-map))

  (use-package tex
    :ensure auctex
    :mode ("\\.tex\\'" . latex-mode)
    :config
    (setq-default TeX-master nil)
    (setq TeX-auto-save t)
    (setq TeX-parse-self t)
    (setq TeX-PDF-mode t)
    (setq reftex-plug-into-AUCTeX t)
    (setq TeX-source-correlate-method 'synctex)
    (setq TeX-source-correlate-mode t)
    (add-hook 'LaTeX-mode-hook
              (lambda ()
                (turn-on-reftex)
                (flyspell-mode)
                (LaTeX-math-mode)))

    ;; Update PDF buffers after successful LaTeX runs
    (add-hook 'TeX-after-compilation-finished-functions
              #'TeX-revert-document-buffer)

    ;; to use pdfview with auctex
    (setq TeX-view-program-selection '((output-pdf "pdf-tools"))
          TeX-source-correlate-start-server t)
    (setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view"))))

  )

(defun myconfig-themes-p ()
  "Loads themes in themes folder and selects theme."
  ;; Load all themes in themes folder
  ;; TODO: Clean up theme loader code
  (let ((basedir "~/.emacs.d/themes/"))
    (dolist (f (directory-files basedir))
      (if (and (not (or (equal f ".") (equal f "..")))
               (file-directory-p (concat basedir f)))
          (add-to-list 'custom-theme-load-path (concat basedir f)))))
  ;; Set default theme
  (load-theme 'monokai t)
  )

;;; TODO: Try to containerize this code here.
(defun myconfig-other-p ()
  "My configuration for other ungrouped things."
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

  (windmove-default-keybindings)
  (use-package yaml-mode)
  (use-package haskell-mode)
  (use-package markdown-mode
    :config
    (add-hook 'markdown-mode-hook 'flyspell-mode))

  ;; Set custom file so emacs doesn't automatically edit init.el
  (setq custom-file "~/.emacs.d/custom-added.el")
  (when (file-exists-p custom-file)
    (load custom-file))

  )

(defun myconfig-main-p ()
  "My configurations."
  (myconfig-package-management-p)
  (myconfig-minimal-ui-p)
  (myconfig-web-mode-p)
  (myconfig-latex-p)
  (myconfig-themes-p)
  (myconfig-other-p)
  )

;;; Run my configurations!
(myconfig-main-p)
