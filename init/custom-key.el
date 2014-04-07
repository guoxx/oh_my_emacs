(defun kill-to-line-beginning ()
  (interactive)
  (kill-visual-line 0))
(global-set-key (kbd "C-S-K") 'kill-to-line-beginning)


(global-set-key (kbd "C-s-<up>") 'ff-find-other-file)

(global-set-key (kbd "M-RET") 'toggle-max-frame)

;; (global-set-key (kbd "M-s") 'save-buffer)
;; (global-set-key (kbd "M-x") 'kill-region)
;; (global-set-key (kbd "M-c") 'kill-ring-save)
;; (global-set-key (kbd "M-v") 'yank)

(provide 'custom-key)
