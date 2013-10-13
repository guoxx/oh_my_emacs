(defun inc-num-region (p m)
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
