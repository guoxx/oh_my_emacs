(global-set-key (kbd "C-S-K") 'xx/kill-to-line-beginning)

(define-key prog-mode-map (kbd "C-s-<up>") 'ff-find-other-file)

(global-set-key (kbd "M-RET") 'toggle-max-frame)

(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)

(eval-after-load 'projectile
  '(progn
     (define-key projectile-mode-map (kbd "C-x p t") 'projectile-find-file)
     (define-key projectile-mode-map (kbd "s-t") 'projectile-find-file)
     (define-key projectile-mode-map (kbd "C-x p s") 'projectile-grep)
     (define-key projectile-mode-map (kbd "C-x p r") 'projectile-replace)
     ))

(global-set-key (kbd "M-;") 'xx/comment-dwim)

(global-set-key (kbd "<left>") 'window-jump-left)
(global-set-key (kbd "<right>") 'window-jump-right)
(global-set-key (kbd "<up>") 'window-jump-up)
(global-set-key (kbd "<down>") 'window-jump-down)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(provide 'custom-key)
