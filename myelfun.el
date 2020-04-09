;;; myelfun.el --- Elisp functions I wrote and, obvi, use at times.
;;;--------------------------------------------------
;;; Commentary:
;; Some of these are bound to be terrible but if they're here, they work.
;;;--------------------------------------------------
;;; Code:

(defvar light-theme 'gruvbox-light-soft)
(defvar dark-theme 'gruvbox-dark-hard)

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

(defun run-game ()
  "Run the Play script with the argument provided by the user when prompted.
   It is to be noted that Emacs will only be useable again when the game has been quit."
  (interactive)
  (let ((script "~/scripts/play.sh")
	(choices '(("g" 1) ("m" 2) ("i" 3) ("p" 4) ("d" 5))))
    (let ((user-choice (completing-read
			"[g]oose [m]inecraft [i]saac [p]sx [d]warffortreess : " choices nil t "")))
      (cond ((string= user-choice "m") (shell-command (concat script " minecraft") nil nil))
	    ((string= user-choice "g") (shell-command (concat script " goose") nil nil))
	    ((string= user-choice "i") (shell-command (concat script " isaac") nil nil))
	    ((string= user-choice "d") (shell-command (concat script " dwarf") nil nil))
	    ((string= user-choice "p") (shell-command (concat script " psx") nil nil))))))

;;;--------------------------------------------------

(provide 'myelfun)
;;; myelfun.el ends here
