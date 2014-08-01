(add-hook 'markdown-mode-hook '(lambda ()
                                 (interactive)
                                 (setq markdown-command "multimarkdown")
                                 (setq markdown-css-path (expand-file-name (concat resources-dir "GitHub2.css")))))
