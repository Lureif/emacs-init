;;; init.el --- My Emacs init file
;;; --------------------------------------------------
;;; Commentary:
;;; This is file is constantly evolving.  What you see now may not be what I currently use.
;;; --------------------------------------------------
;;; Code:

(package-initialize)

;;; --------------------------------------------------
;;; melpa
;;; --------------------------------------------------
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives '("melpa" . "http://melpa.org/packages/") t))

;;; --------------------------------------------------
;;; custom-set-variables
;;; --------------------------------------------------
(setq custom-file (concat user-emacs-directory "/custom.el"))
(load-file custom-file)

;;; --------------------------------------------------
;;; use-package
;;; --------------------------------------------------
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;; --------------------------------------------------
;;; changing the default shit
;;; --------------------------------------------------
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(fset 'yes-or-no-p 'y-or-n-p)
(defvar c-default-style "linux")
(setq inhibit-startup-message t
      initial-buffer-choice 'eshell)

;;; --------------------------------------------------
;;;; My elisp files
;;; --------------------------------------------------
;;; load them
;;; --------------------------------------------------
(load (concat user-emacs-directory "myelfun.el"))

;;; --------------------------------------------------
;;; (and in the darkness) Bind them
;;; --------------------------------------------------
(global-set-key (kbd "C-x p") 'run-game)
(global-set-key (kbd "C-c d") 'clean-dir)
(global-set-key (kbd "C-c p") 'parenthesize)

;;; --------------------------------------------------
;;;; Generic editing stuff
;;; --------------------------------------------------
;;; Editing
;;; --------------------------------------------------

(global-set-key (kbd "M-;")	'comment-or-uncomment-region)
(global-set-key (kbd "M-$") 	'query-replace)

;;; --------------------------------------------------
;;; Movement
;;; --------------------------------------------------
;; --- REGISTERS

(global-set-key (kbd "M-3")   'point-to-register)
(global-set-key (kbd "C-3")   'jump-to-register)

;;; ---------------------------------------------------
;; --- unsetting

(global-unset-key (kbd "C-x r SPC"))
(global-unset-key (kbd "C-x r j"))
(global-unset-key (kbd "C-c ! n"))
(global-unset-key (kbd "C-c ! p"))

;; c-u c-spc jumps.

;;; --------------------------------------------------
;;;; Misc
;;; --------------------------------------------------
(global-set-key (kbd "C-c C-e C-b") 'eval-buffer)
(global-set-key (kbd "M-g M-c")	    'save-buffers-kill-emacs)
;;(global-set-key (kbd "C-c C-q") (lambda () (interactive) (kill-emacs)))

;;; --------------------------------------------------
;;;; Plugins
;;; --------------------------------------------------

(use-package gruvbox-theme
  :ensure t
  :config (load-theme 'gruvbox-dark-hard t))

(use-package basic-c-compile
  :ensure t
  :bind (("C-c C-m C-m" . 'basic-c-compile-makefile) ;; should output message. message in lambda?
	 ("C-c C-m C-c" . 'basic-c-compile-all-files)))

(use-package xref
  :ensure t
  :bind (("M-." . 'xref-find-definitions)
	 ("M-," . 'xref-pop-marker-stack)
	 ("M-?" . 'xref-find-references)))

(use-package telephone-line
  :ensure t
  :config (setq ;;telephone-line-primary-left-separator   'telephone-line-abs-hollow-left
		telephone-line-secondary-left-separator  'telephone-line-abs-hollow-right
		telephone-line-primary-right-separator   'telephone-line-cos-left
		telephone-line-secondary-right-separator 'telephone-line-cubed-left)
  	  (setq telephone-line-height 24
		telephone-line-evil-use-short-tag t)
	  (setq telephone-line-lhs
		'((nil . (telephone-line-buffer-segment
			  telephone-line-nyan-segment))))
	  (telephone-line-mode 1))

(use-package nyan-mode
  :ensure t
  :config  (nyan-mode)
  	   (nyan-start-animation)
  	   (nyan-toggle-wavy-trail))

(use-package smartparens
  :ensure t
  :config (smartparens-global-mode)
	  (show-smartparens-global-mode))

(use-package helm
  :ensure t
  :bind (("C-x C-f"	. 'helm-find-files)
	 ("C-s"		. 'helm-occur)
	 ("C-x C-h"	. 'helm-man-woman)
	 ("C-x b"	. 'helm-mini)
	 ("M-x"		. 'helm-M-x)
	 ("C-h r"	. 'helm-register)
	 ("C-x B"	. 'helm-bookmarks)
	 ("C-x c"	. 'helm-calcul-expression)))

(use-package ace-window
  :ensure t)

(use-package ace-jump-mode
  :ensure t)

(use-package magit
  :ensure t
  :bind (("C-; C-d" . 'magit-diff)
	 ("C-; C-a" . 'magit-stage-file)
	 ("C-; C-b" . 'magit-stage-modified)
	 ("C-; C-g" . 'magit-log)
	 ("C-; C-c" . 'magit-commit)
	 ("C-; C-p" . 'magit-push)
	 ("C-; C-l" . 'magit-clone)
	 ("C-; C-s" . 'magit-status)
	 ("C-; C-u" . 'magit-pull)
	 ("C-; C-i" . 'magit-init)
	 ("C-; C-m" . 'magit-merge)))

(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode))

(use-package company
  :ensure t
  :config (global-company-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :bind	  (("C-h n" . flycheck-next-error)
	   ("C-h p" . flycheck-previous-error)))

(use-package yasnippet
	     :ensure t
	     :config
	     (yas-global-mode t)
	     (yas-reload-all))

(use-package org
  :ensure t
  :bind (("C-c l" . 'org-store-link)
	 ("C-c a" . 'org-agenda)
	 ("C-c c" . 'org-capture)
	 ("C-c b" . 'org-switchb))
  :config
  (setq org-log-done 'time)
  (setq org-agenda-files '("~/.org/school.org"
			   "~/.org/home.org"
			   "~/.org/personal_projects.org"
			   "~/.org/self_progress.org"
			   "~/.org/thoughts.org")))

(use-package org-journal
  :ensure t
  :bind (("C-c j" . 'org-journal-new-entry)
	 ("C-c C-f" . 'org-journal-next-entry)
	 ("C-c C-b" . 'org-journal-previous-entry)
	 ("C-c C-s" . 'org-journal-search))
  :config
  (setq org-journal-dir "~/.org/journal"))

;;; --------------------------------------------------
;;;; Misc. binding
;;; --------------------------------------------------
(global-set-key (kbd "C-c C-v") 'browse-url)
(global-set-key (kbd "C-c C-k") 'browse-kill-ring)
(global-set-key (kbd "C-c C-a")	'recompile)

;;; --------------------------------------------------
;;;; mode hooks & context-specific stuff
;;; --------------------------------------------------
;;; --------------------------------------------------
;;; C
;;; --------------------------------------------------
(add-hook 'c-mode-hook 'display-line-numbers-mode)

;;; --------------------------------------------------
;;; LISP
;;; --------------------------------------------------
;; -- elisp
(add-hook 'emacs-lisp-mode-hook 'display-line-numbers-mode)
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

;;; --------------------------------------------------
;;;; Processing
;;; --------------------------------------------------
;;(setq processing-application-dir "/Applications/Processing.app")
(defvar processing-location	  "~/Downloads/processing-3.5.4/processing-java")
(defvar processing-sketchbook-dir "~/Documents/Processing")

;;;--------------------------------------------------
;;;; transparency!
;;;--------------------------------------------------
;; (set-frame-parameter (selected-frame) 'alpha '(85 85))
;; (add-to-list 'default-frame-alist '(alpha 85 85)

;;;--------------------------------------------------
(provide 'init)
;;; init.el ends here
