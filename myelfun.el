;;; myelfun.el --- Elisp functions I wrote and, obvi, use at times.
;;;--------------------------------------------------
;;; Commentary:
;; Some of these are bound to be terrible but if they're here, they work.
;;;--------------------------------------------------
;;; Code:

(defvar light-theme 'gruvbox-light-soft)
(defvar dark-theme 'dracula)

(defun select-theme ()
  "Asks the user if they want to load a light theme."
  (if (y-or-n-p "Load light theme? ")
      (load-theme light-theme t)
    (load-theme dark-theme t)))

(defun parenthesize (word)
  "Wraps WORD in parens, then jumps to beginning of next word."
  (interactive "p")
  (forward-word)
  (insert ?\))
  (backward-word)
  (insert ?\()
  (forward-word)
  (forward-word)
  (backward-word))
;;;--------------------------------------------------

(provide 'myelfun)
;;; myelfun.el ends here
