(add-hook 'c-mode-common-hook '(lambda ()
                                 (c-set-style "BSD")))

(add-hook 'prog-mode-hook '(lambda ()
                             (interactive)
                             (setq show-trailing-whitespace 1)))
