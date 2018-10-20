(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(dolist (package '(use-package))
   (unless (package-installed-p package)
     (package-install package)))

(require 'use-package)
(setq use-package-always-ensure t)
