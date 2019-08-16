(package-initialize)

;; melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))
(custom-set-variables
 '(custom-safe-themes
   (quote
    ("0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" default)))
 '(org-agenda-files (quote ("~/Documents/personal/org_files/")))
 '(package-selected-packages
   (quote
    (slime company-coq proof-general ace-window flymake-cppcheck yasnippet solarized-theme magit dracula-theme helm)))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces)

;; overall settings
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(global-display-line-numbers-mode)
(setq c-default-style "linux")

;; themes
(load-theme 'dracula t)
;; (load-theme 'tango-dark)
;; (load-theme 'solarized-light)

;; bindings
;;;;HELM
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "C-x C-h") 'helm-man-woman)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)

;;;; MAGIT
(global-set-key (kbd "C-; C-d") 'magit-diff)
(global-set-key (kbd "C-; C-a") 'magit-stage-file)
(global-set-key (kbd "C-; C-c") 'magit-commit)
(global-set-key (kbd "C-; C-p") 'magit-push)
(global-set-key (kbd "C-; C-l") 'magit-clone)
(global-set-key (kbd "C-; C-s") 'magit-status)
(global-set-key (kbd "C-; C-u") 'magit-pull)
(global-set-key (kbd "C-; C-i") 'magit-init)

;;;; MOVEMENT/CONVENIENCE
(global-set-key (kbd "M-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c C-c") 'comment-line)
(global-set-key (kbd "C-c C-j") 'ace-jump-mode)
(global-set-key (kbd "C-c C-l") 'ace-jump-line-mode)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<down>") 'windmove-down)
(fset 'yes-or-no-p 'y-or-n-p)

;;;; TEXT MANIPULATION
(global-set-key (kbd "M-$") 'query-replace)
(global-unset-key (kbd "M-%"))
;;; ;;; C-SPC to activate mark, to to bot right of rectangle and C-x r d to kill rect
;;; ;;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Rectangles.html#Rectangles

;; plugins and such
(ido-mode t)
(setq inferior-lisp-program "clisp")
;; (setq inferior-lisp-program "sbcl")
(require 'org)
