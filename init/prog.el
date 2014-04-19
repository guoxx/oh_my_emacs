(add-hook 'c-mode-common-hook '(lambda ()
                                 (c-set-style "linux")))

(add-hook 'prog-mode-hook '(lambda ()
                             (interactive)
                             (setq show-trailing-whitespace 1)))

(add-hook 'lua-mode-hook 'flycheck-mode)
