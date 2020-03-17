(package-initialize)
;; melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("50ff65ab3c92ce4758cc6cd10ebb3d6150a0e2da15b751d7fbee3d68bba35a94" "7a1190ad27c73888f8d16142457f59026b01fa654f353c17f997d83565c0fc65" "cbd8e65d2452dfaed789f79c92d230aa8bdf413601b261dbb1291fb88605110c" "4a91a64af7ff1182ed04f7453bb5a4b0c3d82148d27db699df89a5f1d449e2a4" "ad16a1bf1fd86bfbedae4b32c269b19f8d20d416bd52a87cd50e355bf13c2f23" "4bf5c18667c48f2979ead0f0bdaaa12c2b52014a6abaa38558a207a65caeb8ad" "ecfd522bd04e43c16e58bd8af7991bc9583b8e56286ea0959a428b3d7991bbd8" "36282815a2eaab9ba67d7653cf23b1a4e230e4907c7f110eebf3cdf1445d8370" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "44961a9303c92926740fc4121829c32abca38ba3a91897a4eab2aa3b7634bed4" "3be1f5387122b935a26e02795196bc90860c57a62940f768f138b02383d9a257" "9c4acf7b5801f25501f0db26ac3eee3dc263ed51afd01f9dcfda706a15234733" "3de3f36a398d2c8a4796360bfce1fa515292e9f76b655bb9a377289a6a80a132" "ed36f8e30f02520ec09be9d74fe2a49f99ce85a3dfdb3a182ccd5f182909f3ab" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "196df8815910c1a3422b5f7c1f45a72edfa851f6a1d672b7b727d9551bb7c7ba" "446cc97923e30dec43f10573ac085e384975d8a0c55159464ea6ef001f4a16ba" "50b64810ed1c36dfb72d74a61ae08e5869edc554102f20e078b21f84209c08d1" "100eeb65d336e3d8f419c0f09170f9fd30f688849c5e60a801a1e6addd8216cb" "d9850d120be9d94dd7ae69053630e89af8767c36b131a3aa7b06f14007a24656" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" default)))
 '(org-agenda-files
   (list "~/Documents/personal/org_files/daily_todo.org" "~/Documents/personal/org_files/longshort_term_todo.org"))
 '(package-selected-packages
   (quote
    (yasnippet-snippets paredit cider clojure-mode helm-spotify-plus helm-spotify pdf-tools undo-tree org-journal flycheck-clang-tidy base16-theme powerline company find-file-in-project yasnippet gruvbox-theme ace-jump-mode org slime proof-general ace-window flymake-cppcheck solarized-theme magit dracula-theme helm)))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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
