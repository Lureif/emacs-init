(package-initialize)
;; melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

(setq custom-file (concat user-emacs-directory "/custom.el"))
(load-file custom-file)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

;; overall settings
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; (global-display-line-numbers-mode)
(setq c-default-style "linux")

;; themes
(load-theme 'dracula t)		;; dark purple (a little cringe)
;;(load-theme 'gruvbox-dark-hard t)	;; go-to dark theme
;;(load-theme 'base16-classic-dark)	;; yet another tango-dark style theme
;;(load-theme 'solarized-light)		;; greyish-beige
;;(load-theme 'gruvbox-light-soft)	;; light yellow
;;(load-theme 'base16-mocha)		;; mellow brown
;;(load-theme 'base16-rebecca)		;; purple
;;(load-theme 'base16-3024)		;; black and grey
;;(load-theme 'base16-icy)		;; dark blue
;;(load-theme 'base16-cupcake)		;; purple-ish white (v good)

(use-package powerline
  :ensure t
  :config (powerline-default-theme))

;;;; bindings
;; HELM
(use-package helm
  :ensure t
  :bind (("C-x C-f"	. 'helm-find-files)
	 ("C-s"		. 'helm-occur)
	 ("C-x C-h"	. 'helm-man-woman)
	 ("C-x b"	. 'helm-mini)
	 ("M-x"		. 'helm-M-x)))

;; MAGIT
(use-package magit
  :ensure t
  :bind (("C-; C-d" . 'magit-diff)
	 ("C-; C-a" . 'magit-stage-file)
	 ("C-; C-c" . 'magit-commit)
	 ("C-; C-p" . 'magit-push)
	 ("C-; C-l" . 'magit-clone)
	 ("C-; C-s" . 'magit-status)
	 ("C-; C-u" . 'magit-pull)
	 ("C-; C-i" . 'magit-init)
	 ("C-; C-m" . 'magit-merge)))

;;;; Movement/Convenience
(global-set-key (kbd "M-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c C-c") 'comment-line)
(global-set-key (kbd "C-x C-j") 'ace-jump-mode)
(global-set-key (kbd "C-x C-l") 'ace-jump-line-mode)
(global-set-key (kbd "C-x o") 'ace-window)
;; (global-set-key (kbd "C-<left>") 'windmove-left)
;; (global-set-key (kbd "C-<right>") 'windmove-right)
;; (global-set-key (kbd "C-<up>") 'windmove-up)
;; (global-set-key (kbd "C-<down>") 'windmove-down)
(global-set-key (kbd "C-c C-e C-b") 'eval-buffer)
(global-set-key (kbd "M-$") 'query-replace)
(global-unset-key (kbd "C-; \?t"))
(fset 'yes-or-no-p 'y-or-n-p)

;; plugins and such
(ido-mode t)
(setq inferior-lisp-program "sbcl")

(use-package company
  :ensure t
  :config (global-company-mode))
  ;; (company-clang t)
  ;; (company-elisp t)
  ;; (company-yasnippet t))
(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

;; (use-package yasnippet
;;   :ensure t
;;   :config (yas-global-mode t))

(use-package yasnippet
	     :ensure t
	     :config
	     (yas-global-mode t)
	     (yas-reload-all))

;; ORG
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
			   "~/.org/thoughts.org"))
  ;; (setq org-agenda-file-regexp "\\`\\\([^.].*\\.org\\\|[0-9]\\\{8\\\}\\\(\\.gpg\\\)?\\\)\\'")
  ;; (add-to-list 'org-agenda-files org-journal-dir)
  (use-package org-journal
    :bind (("C-c j" . 'org-journal-new-entry)
	   ("C-c C-f" . 'org-journal-next-entry)
	   ("C-c C-b" . 'org-journal-previous-entry)
	   ("C-c C-s" . 'org-journal-search))
    :config
    (setq org-journal-dir "~/.org/journal")))
;; start up setup
(setq inhibit-startup-message t
      initial-buffer-choice 'eshell)

;;;; transparency!
;; (set-frame-parameter (selected-frame) 'alpha '(85 85))
;; (add-to-list 'default-frame-alist '(alpha 85 85))
