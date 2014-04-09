(defun xx/kill-to-line-beginning ()
  (interactive)
  (kill-visual-line 0))

(defun xx/inc-num-region (p m)
   "Increments the numbers in a given region"
   (interactive "r")
   (save-restriction
     (save-excursion
       (narrow-to-region p m)    
       (goto-char (point-min))   
       (forward-line)
       (let ((counter 1))
         (while (not (eq (point)
                         (point-max)))
           (goto-char (point-at-eol))
           (search-backward-regexp "[0-9]+" (point-at-bol) t)
           (let* ((this-num (string-to-number (match-string 0)))
                  (new-num-str (number-to-string (+ this-num
                                                    counter))))
             (replace-match new-num-str)
             (incf counter)
             (forward-line)))))))

(defun xx/comment-dwim (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and
we are not at the end of the line, then comment current line.
Replaces default behaviour of comment-dwim,
when it inserts comment at the end of the line. "

  (interactive "*P")
  (comment-normalize-vars)

  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
