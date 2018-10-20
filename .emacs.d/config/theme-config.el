;; How to get themes?
;;   Search for 'emacs themes' and git clone into the themes folder.

;; Add all themes in themes folder
(let ((basedir "~/.emacs.d/themes/"))
  (dolist (f (directory-files basedir))
    (if (and (not (or (equal f ".") (equal f "..")))
             (file-directory-p (concat basedir f)))
        (add-to-list 'custom-theme-load-path (concat basedir f)))))
;; Set default theme
(load-theme 'monokai t)
