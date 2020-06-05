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
   'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

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
(defvar inferior-lisp-program "sbcl")
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
;;;; Aesthetics
;;; --------------------------------------------------
;;; Font
;;; --------------------------------------------------
;; (add-to-list 'default-frame-alist
;; 	     '(font . "-ADBO-Source Code Pro-semibold-italic-normal-*-*-*-*-*-m-0-iso10646-1"))

;;; --------------------------------------------------
;;; Themes
;;; --------------------------------------------------
(load-theme 'base16-spacemacs t)
;;(load-theme 'base16-pop t)		;; v dark much blackness
;;(load-theme 'base16-rebecca)		;; purple
;;(load-theme 'base16-cupcake)		;; purple-ish + white (v kawaii)
;;(select-theme)

;;; --------------------------------------------------
;;;; Generic editing stuff
;;; --------------------------------------------------
;;; Editing
;;; --------------------------------------------------
(global-set-key (kbd "M-;")	'comment-or-uncomment-region)
(global-set-key (kbd "C-c C-c") 'comment-line)
(global-set-key (kbd "M-$") 	'query-replace)

;;; --------------------------------------------------
;;; Movement
;;; --------------------------------------------------
(global-set-key (kbd "C-x j") 'ace-jump-mode)
(global-set-key (kbd "C-x l") 'ace-jump-line-mode)
(global-set-key (kbd "C-x o") 'ace-window)

;;; --------------------------------------------------
;;; misc
;;; --------------------------------------------------
(global-set-key (kbd "C-c C-e C-b") 'eval-buffer)
(global-set-key (kbd "M-#") 	    'eshell)
(global-set-key (kbd "M-3") 	    'next-buffer)
(global-set-key (kbd "C-3")	    'previous-buffer)
(global-set-key (kbd "C-c C-x C-q") (lambda () (interactive) (kill-emacs)))

;;; --------------------------------------------------
;;; unsetting key bingings
;;; --------------------------------------------------
(global-unset-key (kbd "C-x C-c"))

;;; --------------------------------------------------
;;;; Plugins
;;; --------------------------------------------------
(use-package dumb-jump
  :ensure t
  :bind (("C-c g" . 'dumb-jump-go)
  	 ("C-c b" . 'dumb-jump-back)
	 ("C-c q" . 'dumb-jump-quick-look)))

(use-package nyan-mode
  :ensure t
  :config  (nyan-mode)
  	   (nyan-start-animation)
  	   (nyan-toggle-wavy-trail))

(use-package powerline
  :ensure t
  :config (powerline-default-theme))

(use-package smartparens
  :ensure t
  :config (smartparens-global-strict-mode))

(use-package helm
  :ensure t
  :bind (("C-x C-f"	. 'helm-find-files)
	 ("C-s"		. 'helm-occur)
	 ("C-x C-h"	. 'helm-man-woman)
	 ("C-x b"	. 'helm-mini)
	 ("M-x"		. 'helm-M-x)))

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
  :config (global-flycheck-mode))

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

(use-package cider
  :ensure t)

;;; --------------------------------------------------
;;;; Misc. binding
;;; --------------------------------------------------
(global-set-key (kbd "C-c C-v") 'browse-url)
(global-set-key (kbd "C-c C-k") 'browse-kill-ring)
(global-set-key (kbd "M-!")	(lambda () (interactive) (shell-command "dmenu_run")))
(global-set-key (kbd "C-c C-a")	'recompile)

;;; --------------------------------------------------
;;;; mode hooks
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
