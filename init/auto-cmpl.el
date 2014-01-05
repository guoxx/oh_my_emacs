(add-to-list 'load-path "~/.emacs.d/packages/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/packages/auto-complete/ac-dict")
(setq ac-comphist-file "~/.emacs.d/ignore-files/ac-comphist.dat")
(ac-config-default)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
