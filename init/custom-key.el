(defun kill-to-line-beginning ()
  (interactive)
  (kill-visual-line 0))
(global-set-key (kbd "C-S-K") 'kill-to-line-beginning)


(provide 'custom-key)
